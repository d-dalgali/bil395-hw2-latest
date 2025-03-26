use std::collections::HashMap;
use std::io::{self, Write};
use meval::Expr;
use regex::Regex;
use std::str::FromStr;

fn main() {
    let mut variables: HashMap<String, f64> = HashMap::new();
    println!("Rust Calculator (press Ctrl+C to exit)");

    loop {
        print!("> ");
        io::stdout().flush().unwrap();

        let mut input = String::new();
        if io::stdin().read_line(&mut input).is_err() {
            break;
        }

        let input = input.trim();
        if input.is_empty() {
            continue;
        }

        if let Some((var, expr)) = input.split_once('=') {
            let var = var.trim();
            let expr = preprocess_expression(expr.trim());
            let expr_replaced = replace_variables(&expr, &variables);

            match Expr::from_str(&expr_replaced).and_then(|e| e.eval()) {
                Ok(val) => {
                    variables.insert(var.to_string(), val);
                    println!("{} = {}", var, val);
                }
                Err(e) => println!("Error: Evaluation failed. Details: {}", e),
            }
        } else {
            let expr = preprocess_expression(input);
            let expr_replaced = replace_variables(&expr, &variables);

            match Expr::from_str(&expr_replaced).and_then(|e| e.eval()) {
                Ok(val) => println!("Result: {:.2}", val),
                Err(e) => println!("Error: Evaluation failed. Details: {}", e),
            }
        }
    }
}

fn replace_variables(expr: &str, vars: &HashMap<String, f64>) -> String {
    let mut output = expr.to_string();
    for (name, value) in vars {
        let pattern = format!(r"\b{}\b", regex::escape(name));
        let value_str = format!("{}", value);
        output = Regex::new(&pattern).unwrap().replace_all(&output, value_str).to_string();
    }
    output
}

fn preprocess_expression(expr: &str) -> String {
  // Replace ** with ^ only
  expr.replace("**", "^")
}


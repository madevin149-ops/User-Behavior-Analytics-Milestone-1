# Task 1: Data
data = [
   {"user_id": 1, "event_type": "purchase", "amount": 200},
   {"user_id": 2, "event_type": "purchase", "amount": 500},
   {"user_id": 3, "event_type": "login", "amount": 0}
]

# Task 2 & 3: Filter and Map
def filter_purchases(data_list):
    return list(filter(lambda x: x['event_type'] == 'purchase', data_list))

amounts = list(map(lambda x: x['amount'], data))

# Task 4 & 5: Lambda and Higher-Order Function
discounted = list(map(lambda x: x * 0.9, amounts))

def apply_func(func, items):
    return [func(i) for i in items]

# PART 5: EXCEPTION HANDLING
def safe_process(items):
    try:
        if not items: raise ValueError("List is empty")
        avg = sum(items) / len(items)
        print(f"Average: {avg}")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        print("Process Finished.")

safe_process(amounts)
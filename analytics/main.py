from processor import filter_purchases
from utils.helper import to_float

data = [{"user_id": 1, "event_type": "purchase", "amount": 200}]

def run():
    purchases = filter_purchases(data)
    amounts = [p['amount'] for p in purchases]
    print(f"Float Amounts: {to_float(amounts)}")

if __name__ == "__main__":
    run()
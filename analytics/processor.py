def filter_purchases(data):
    return [item for item in data if item['event_type'] == 'purchase']
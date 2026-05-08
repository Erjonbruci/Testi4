#!/bin/bash

# ============================================
#        Simple Interest Calculator
# ============================================

echo "========================================"
echo "       Simple Interest Calculator       "
echo "========================================"
echo ""

# Input: Principal Amount
read -p "Enter Principal Amount (P): " principal

# Input: Rate of Interest
read -p "Enter Rate of Interest in % (R): " rate

# Input: Time Period
read -p "Enter Time Period in years (T): " time

# Validate that inputs are not empty
if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
  echo ""
  echo "❌ Error: All fields are required. Please enter valid values."
  exit 1
fi

# Validate that inputs are positive numbers
if (( $(echo "$principal <= 0" | bc -l) )) || \
   (( $(echo "$rate <= 0" | bc -l) )) || \
   (( $(echo "$time <= 0" | bc -l) )); then
  echo ""
  echo "❌ Error: All values must be greater than zero."
  exit 1
fi

# Calculate Simple Interest: SI = (P * R * T) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate Total Amount: A = P + SI
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display Results
echo ""
echo "========================================"
echo "              Results                   "
echo "========================================"
echo "  Principal Amount  : $principal"
echo "  Rate of Interest  : $rate%"
echo "  Time Period       : $time years"
echo "----------------------------------------"
echo "  Simple Interest   : $simple_interest"
echo "  Total Amount      : $total_amount"
echo "========================================"

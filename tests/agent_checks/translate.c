/* Standalone input for the C-to-IDEKA translator and native compiler. */
int sum_readings(int base, int count) {
    int sum = 0;
    for (int i = 0; i < count; i++) {
        sum += base + i;
    }
    return sum;
}

int main(void) {
    return sum_readings(4, 3) == 15 ? 0 : 1;
}

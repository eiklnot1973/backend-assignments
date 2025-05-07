const permutation = (n, r) => {
    let product = 1;
    for (let i = 0; i < r; i++) {
        product = product * (n - i);
    }
    return product;
};

const combination = (n, r) => {
    return permutation(n, r) / permutation(r, r);
};

const multiPermutation = (n, r) => {
    let product = 1;
    for (let i = 0; i < r; i++) {
        product = product * n;
    }
    return product;
}

module.exports = {
    permutation: permutation,
    combination: combination,
    multiPermutation: multiPermutation,
    multiCombination: (n, r) => combination(n+r-1, r),
};
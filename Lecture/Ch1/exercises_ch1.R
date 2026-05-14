# exercise 1.4.1
# 1.4.1 새로운 무작위 샘플 추출
set.seed(42) # 결과 고정을 위해 설정
sample_1_4_1 <- sample(ages, 10)
print(sample_1_4_1)

# 데이터 저장
write.csv(data.frame(Age = sample_1_4_1), "exercise_1_4_1.csv")


# exercise 1.4.2
# 두 번째 무작위 샘플 추출
sample_1_4_2 <- sample(ages, 10)

# 중복된 값 확인 (나이 값 기준)
duplicates <- intersect(sample_1_4_1, sample_1_4_2)
print(duplicates)


  
# exercise 1.4.3
# 1. 무작위 샘플 (n=15)
rand_sample <- sample(ages, 15)

# 2. 체계적 샘플 (n=15)
k <- floor(length(ages) / 15) # 간격 12
sys_idx <- seq(from = sample(1:k, 1), by = k, length.out = 15)
sys_sample <- ages[sys_idx]

# 시각적 비교
boxplot(rand_sample, sys_sample, names=c("Random", "Systematic"), 
        main="Comparison of Sampling Methods", col=c("lightblue", "lightgreen"))





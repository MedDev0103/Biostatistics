# Subject No. 1번부터 189번까지의 Age 데이터입니다.
subject <- c(
  # 1-36
  48, 35, 46, 59, 43, 42, 39, 44, 49, 49, 44, 39, 38, 49, 49, 53, 56, 57, 51, 61, 53, 66, 71, 75, 72, 65, 67, 38, 37, 46, 44, 44, 48, 49, 30, 45,
  # 37-48
  47, 45, 48, 47, 47, 44, 43, 43, 45, 40, 48, 49,
  # 49-84
  38, 64, 43, 47, 46, 57, 52, 54, 56, 53, 64, 53, 58, 54, 59, 56, 62, 50, 64, 53, 61, 53, 62, 57, 52, 54, 61, 59, 57, 54, 52, 63, 62, 52, 62, 57,
  # 85-96
  59, 59, 56, 53, 57, 59, 61, 55, 61, 56, 52, 54,
  # 97-132
  51, 50, 50, 55, 63, 50, 59, 54, 60, 50, 56, 68, 66, 71, 82, 68, 78, 66, 70, 66, 78, 69, 71, 69, 78, 66, 68, 71, 69, 77, 76, 71, 43, 47, 48, 37,
  # 133-144
  40, 42, 38, 49, 43, 46, 34, 40, 46, 48, 47, 43,
  # 145-180
  52, 53, 61, 60, 53, 53, 50, 53, 54, 61, 61, 61, 64, 53, 54, 54, 61, 60, 51, 64, 64, 69, 60, 64, 55, 58, 62, 54, 62, 53, 61, 53, 61, 54, 51, 62,
  # 181-189
  57, 50, 64, 63, 65, 71, 71, 73, 66
)

# 데이터 개수가 맞는지 확인 (189가 나와야 합니다)
length(subject)



# example 1.4.1
# 1. 무작위 샘플링 수행 (10명 뽑기)
# 실행할 때마다 결과가 달라지지 않게 하려면 set.seed(번호)를 앞에 쓰면 좋습니다.
selected_ids <- sample(subject, 10)

# 2. 뽑힌 번호에 해당하는 나이(Age) 데이터 매칭하기
selected_ages <- subject[selected_ids]

# 3. 결과 데이터를 표(Data Frame) 형태로 만들기
# 책의 Table 1.4.2와 같은 구조로 만듭니다.
sample_table <- data.frame(
  Order = 1:10,               # 순번
  Subject_No = selected_ids,  # 뽑힌 피험자 번호
  Age = selected_ages         # 그 번호의 나이
)
# 4. 화면에 결과 출력해서 확인
print(sample_table)

setwd('C:\\Users\\imper\\Git\\Biostatistics\\Lecture\\Ch1')

# 5. CSV 파일로 저장하기
# 파일명은 "sample_result.csv"로 지정했습니다.
write.csv(sample_table, "sample_result.csv", row.names = FALSE)

# 6. 파일이 어디 저장됐는지 확인하기 (콘솔에 경로가 뜹니다)
getwd()



# example 1.4.2
# 1. 기초 변수 설정 (교재 Example 1.4.2 기준)
x <- 4    # 시작점 (Starting point)
k <- 18   # 샘플 간격 (Interval)
n <- 10   # 추출할 샘플 개수

# 2. 체계적 번호 생성
# seq() 함수를 사용하여 4부터 시작해 18씩 더하며 10개를 만듭니다.
systematic_ids <- seq(from = x, by = k, length.out = n)

# 결과 확인: 4, 22, 40, 58, 76, 94, 112, 130, 148, 166
print(systematic_ids)

# 3. 추출된 번호에 해당하는 나이(Age) 매칭
# 기존에 입력해둔 subject 벡터를 활용합니다.
systematic_ages <- subject[systematic_ids]

# 4. 결과 표(Table 1.4.3) 생성
table_1_4_3 <- data.frame(
  Systematically_Selected_Subject_Number = systematic_ids,
  Age = systematic_ages
)

# 5. 화면 출력 및 CSV 저장
print(table_1_4_3)
write.csv(table_1_4_3, "systematic_sample_result.csv", row.names = FALSE)

# 6. 파일이 어디 저장됐는지 확인하기 (콘솔에 경로가 뜹니다)
getwd()



# example 1.4.3
# 1. 환경 설정 (이전의 ages 데이터가 로드되어 있어야 합니다)
set.seed(123) # 결과 재현을 위한 시드 설정

# 2. 단순 무작위 샘플 추출 (n=15)
random_15 <- sample(subject, 15)

# 3. 체계적 샘플 추출 (n=15)
# 간격 k 계산: 189 / 15 = 12.6 -> k=12로 설정
k_val <- floor(length(subject) / 15) 
start_idx <- sample(1:k_val, 1) # 시작점 랜덤 선택
sys_idx <- seq(from = start_idx, by = k_val, length.out = 15)
systematic_15 <- ages[sys_idx]

# 4. 시각적 비교 (히스토그램)
par(mfrow = c(1, 2)) # 화면을 1행 2열로 분할

hist(random_15, main = "Random Sample (n=15)", 
     xlab = "Age", col = "skyblue", border = "white")

hist(systematic_15, main = "Systematic Sample (n=15)", 
     xlab = "Age", col = "orange", border = "white")

# 5. 수치적 비교 확인
summary(random_15)
summary(systematic_15)




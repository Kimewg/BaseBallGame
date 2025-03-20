class Game {
    
    // 컴퓨터가 숫자를 랜덤하게 3개 뽑는 함수
    func computer() -> [Int] {
        var computerChoice : [Int] = [1,2,3,4,5,6,7,8,9]
        computerChoice.shuffle() // 배열을 섞음
        return Array(computerChoice.prefix(3)) // 배열 앞자리 3개 리턴
    }
    // 플레이어가 숫자 3개를 입력하는 함수
    func player() -> [Int] {
        print("숫자를 입력하세요(공백으로 구분)")
        // 숫자를 입력 받고 공백으로 구분하요 배열로 반환
        let playerChoice = readLine()!.split(separator: " ").map{Int($0)!}
        
        return playerChoice
    }
    // 정답 확인하는 함수
    func answer(computer:[Int], player:[Int]) -> String {
        if computer == player {
            return "정답입니다"
        } else {
            return "틀렸습니다"
        }
    }
}

let game = Game()
let computer = game.computer()

print("< 게임을 시작합니다 >")
// 정답이 나올 때까지 게임 반복
while true {
    let player = game.player()
    let result = game.answer(computer: computer, player: player)
    print(result)
    
    if result == "정답입니다"{
        break
    }
}

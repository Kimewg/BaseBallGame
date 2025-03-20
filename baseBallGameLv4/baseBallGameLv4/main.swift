import Foundation

struct Game {
    
    // 컴퓨터가 숫자를 랜덤하게 3개 뽑는 함수
    func computer() -> [Int] {
        var computerChoice : [Int] = [0,1,2,3,4,5,6,7,8,9]
        
        // [0]번째 숫자가 0이 아닐때까지 배열을 섞음
        repeat{
            computerChoice.shuffle() // 배열을 섞음
        } while computerChoice[0] == 0
        
        return Array(computerChoice.prefix(3)) // 배열 앞자리 3개 리턴
    }
    // 플레이어가 숫자 3개를 입력하는 함수
    func player() -> [Int] {
        while true { // 입력이 올바를 때까지 반복
            print("숫자를 입력하세요(공백으로 구분)")
            // 숫자를 입력 받고 공백으로 구분, 배열로 반환
            let playerChoice = readLine()!.split(separator: " ").map{Int($0)!}
            // 입력값이 3개가 아닌 경우, 1~9 이외의 다른 숫자가 있는 경우, 중복된 숫자가 있는 경우를 예외처리
            if playerChoice.count != 3 || playerChoice.contains(where: {$0 < 0 || $0 > 9}) || Set(playerChoice).count != 3{
                print("올바르지 않은 입력값입니다.")
            } else{
                return playerChoice
            }
        }
    }
    // 정답 확인하는 함수
    func answer(computer:[Int], player:[Int]) -> String {
        var strike = 0
        var ball = 0
        // 컴퓨터 배열과 플레이어 배열이의 숫자와 위치가 같은 수만큼 +
        for i in 0..<3 {
            if computer[i] == player[i] {
                strike += 1
                // 컴퓨터 배열 안에 플레이어 배열 숫자가 있으면 +
            }else if computer.contains(player[i]) {
                ball += 1
            }
            
        }
        // 스트라이크가 3이면 정답 출력
        if strike == 3 {
            return "정답입니다"
        } else if strike == 0 && ball == 0 {
          return "Nothing"
        } else{
            return "\(strike)스트라이크 \(ball)볼"
        }
    }
    // 처음 시작하면 보이는 메인화면
    func main() {
        print("환영합니다! 원하시는 번호를 입력해주세요\n1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
        if let choice = readLine(){
        switch choice{
        case "1" :
            startGame()
        case "2" :
            print("2. 게임 기록 보기")
        case "3" :
            print("3. 종료하기")
        default:
            print("올바른 번호를 입력해주세요.")
            }
        }
    }
    // 메인화면에서 1을 입력했을 경우, 게임 시작하기
    func startGame(){
        let computer = game.computer()
            // 정답이 나올 때까지 게임 반복
        print("< 게임을 시작합니다 >")
        while true {
            let player = player()
            let result = answer(computer: computer, player: player)
            print(result)
                
            if result == "정답입니다" {
                    main() // 정답을 맞췄을 경우 메인 회면으로 다시 돌아감
            }
        }

    }
}

let game = Game()
game.main()
              



# Lab 9

## 실습 내용
### 리모컨 송신 신호 
#### Submodule 1 : 적외선 신호를 받아 Lead code, custom code, data code 받기

Top Module : 이전 코드들을 활용하여 ir_rx 모듈과합쳐 주기

리모컨의 수신에서 leader code를 제외한 총 32비트를 받게 된다. leader code에서는 high 9ms와 low 4.5ms 신호를 받는데
그 이후 custom code와 datacode로 나눠어져 32비트의 신호를 받는다. 모든 신호는 high에서 low로 떨어지는데 여기서 1 과 0을 구분하는 방법은 low신호가 1000ms가 넘어가면 1이 된다. 모듈  ir_rx에서 seq_rx 는 2비트로 이전 신호와 현재 신호를 볼수 있는데 2'b00은 cnt_l을 1씩 추가 해주고,2'b01은 초기화하여 다시 신호를 본다. 그리고 2'b11은 cnt_h에 1씩 추가 해준다.  2'b10는 신호를 이미 저장한 모습이다.  나중에 fnd_dec 모듈에서 총 24 비트의 신호를 받게 되는데 원래 ir_rx 모듈에서 나오는 신호는 32비트 이지만 i_num은 4비트 이고 FPGA는 총 6개의 숫자를 보낼수 있기 땨문에 24비트만 우리는 볼수 있다.

이때 wave를 보게 되면 리모컨은 우리가 받아야할 신호와 반대의 신호를 주기 때문에 ir_rx의 신호는 리모컨과 반대이다. 아래의 사진을 보면 LEADCODE  가 위로 9ms 동안  아래로 4.5ms동안 가고 나머지는 교수님이 짜주신 코드와 동일 함을 볼 수 있다.

![](https://github.com/soyoungna/LogicDesign/blob/master/Practice09/리모컨.JPG
)

<!--stackedit_data:
eyJoaXN0b3J5IjpbMjE0NTQ0ODA5N119
-->
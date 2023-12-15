pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- xmas night rush
-- by andrey neto
#include main.lua

#include core/class.lua
#include core/chunk.lua
#include core/background.lua
#include core/entity.lua
#include core/scene.lua
#include core/utils.lua

#include entities/particles.lua
#include entities/santa.lua
#include entities/coin.lua

#include scenes/game_scene.lua
#include scenes/title_scene.lua
__gfx__
0000000000aaaa00000aa000000aa000000aa0000077aa00000aa000000aa000000aa0003333aa1111aa33337171711888888888666666660077777777777700
00000000099999a000999a0000999a0000a99900079999a00099770000999a0000a99900333aa111171aa3331717171777777777666666660777777776777770
0070070049944a9a0499a9a00049aa000a99494079944a9a049779a00049aa000a99494033aa77771111aa33717171188888888866666666d67777766d67776d
0007700049499a9a0494a9a00044aa000a9a494049499a9a0477a9a00044a7000a9a49403aaa11117711aaa31717171777777777666666666d67776dd6d666d6
0007700049499a9a0494a9a00044aa000a9a494049499a9a0774a9a0004477000a9a49703aaa17111171aaa311111118888888886666666666d666d6666ddd66
00700700494aa99a049499a000449a000a9a9940494aa99a079499a000477a000a9a997033aa11711117aa33777777777777777766666666666ddd6666666666
000000000499999000499900004999000099940004999990004999000077990000999700333aa111171aa3338888888888888888666666666666666666666666
0000000000444400000440000004400000044000004444000004400000044000000770003333aa1711aa33337777777777777777666666666666666666666666
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007777777777777777
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007777777776777777
0000007770000770007700000007777700007700007700000777777700000000777777000077700000000000777770000770000770000000677777766d677776
0000076667007667076670000776666670076670076600077666666670000007666666700066670077000007666667007667007660000000d667776dd6d6666d
00000666660066660666600076666666d00666600666707666666666d000000666dd6667076666076670007666d66d0066660066670000006dd666d6666dddd6
0000066666706666066660006666dddd0006666006666066666666dd000000766d00666606666d0666600066660dd0006666006666000000666ddd6666666666
000006666660666606666007666d000000066667766660d66d66660000000066600066660666600d666700d66670000066667766660000006666666666666666
00007666d66066660666600666600777700666666666600dd0666600000000666007666d066660006666000d6667700066666666660000006666666666666666
0000666606676666066660066660766667066666666666000066660000000766677666d00666600066660000dd66670066666666667000007777777777777777
0000666606666660066667066660dd666606666ddd6666000066660000000666666666000666670766660077006666706666ddd6666000007777777777777777
000066660d6666600666660d666700666d0666600066660000666670000006666d6666700d666676666d07667766666066660006666000006777777767777776
00006666006666600666660066667766600666600066660000d666600000066660d666670066666666600666666666d06666000666600000d6777776d667766d
0000d66d00d666d00d666d00dd66666dd00d66d000d66d00000666d000000d66d00d666d00d6666666d00d666666dd00d66d000d66d000006d66666d6dd66dd6
00000dd0000ddd0000ddd00000ddddd00000dd00000dd000000ddd00000000dd0000ddd0000ddddddd0000dddddd00000dd00000dd00000066ddddd6666dd666
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006666666666666666
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006666666666666666
05500550022002200440044002200220077ee77ee77ee77ee77ee77000568700e77ee77e6666666666666666000000003bb00000000003336666666666666666
53b553b528e228e249a449a428e228e256886688668866886688668800586700668866886666666666666666000000003abb000000003bba7766666666667666
535bb535282ee282494aa494282ee2825886688668866886688668870026670068866886666666666666666600000000333bba00003bbbb3d77667666666d666
0eee53e00b82bbb00eee49e0aaaa28aa28668866886688668866886700566e00886688666d66666666666666000000000333bbbbbbabb3336dd66d766d766776
e8885b8e33e23333e8884a8ea9992e9a26688668866886688668866e0056870086688668d5d6666dd666666d0000000000ba3bab3b333bb0666666d666776dd6
e8885b8833e23333e8884a88a9992e990522552255225522552255200058670055225522505dddd55dd666d5000000000000b333a333ba006676666666d76666
88885388338233338888498899992899000000000000000000000000002667000056670000055550055ddd5000000000000000000000000066d66766666d6666
0222222005555550022222204444444400000000000000000000000000566e0000566e00000000000005550000000000000000000000000066666d6666666666
00008888888000000000888888800000000088888880000000008888888000000000888888800000000888888880000000008888888000000000888888800000
00088777777700000008877777770000000887777777000000088777777700000008877777770000008887777777000000888777777700000008877777770000
00886fff1ff1000000886fff1ff1000000886fff1ff1000007886fff1ff1000000886fff1ff1000078806fff1ff1000008806fff1ff1000000886fff1ff10000
0780666fffff00000080666fffff00000780666fffff00000770666fffff00007880666fffff00007700666fffff00007800666fffff00000780666fffef0000
07700866666600000780086666660000077008666666000000000866666600007700086666660000000008666666000077000866666600000770886666660000
00008e886666000007708e8866660000000888886666000000008e886666000000008e886666000000008e886666000000008e886666000000088e8866668000
00088e888668800000088e88866880000888ee888668880000088e888668800000008e8886620000000088e88662000000008e888662000000088e8886688000
00088e88878880000008e88887888800888e8888878288800008e88887828800000088e8878200000000888ef7820000000088e8878200000008e88887828000
0008e888878280000088e8888782ff00ff00888887880ff00088e8888788ff00000088e88788000000002888f7880000000088e8878800000008e8888788f000
0008e8888788f000008e8888878800000000888887880000008e8888878800000000288e8788000000008222878800000000288e87880000000ff88887880000
000ff4449944000000ff444499440000000044449944000000ff444499440000000044ff994400000000444499440000000044ff994400000000444499440000
00007777777700000000777777770000000078e77777000000007877777700000000777777778000000077777777200000007777777700000000777777770000
0000888888880000000088e8888800000000888e8880000000008882888000000000888e88888000000488ee888822000048888e888800000000888888880000
000088e0888000000000888e8880000000008888e8000000000088e88000000000008880008880000044ee00000000000008888088880000000088e088800000
00004400022000000000088428000000000000044000000000000440000000000004480000020000000000000000000000000000082200000000440002200000
00004000020000000000000420000000000000020000000000000040000000000000000000000000000000000000000000000000002000000000400002000000
000000000000000000000000000000000000000000000000000000f0000000000000049f00000000000000000000000000000000000000000000000000000000
0000000000000000000000dddd00000000000000000000000000049f000000000000049f00000000000000000000000000000000000000000000000000000000
000000000000000000000d7777d000000000000ddddd000000000444000000000000049f00000000000000000000000000000000000000000000000000000000
00000000000000000000d777777d0000000000d77777d00000555555555500000000049f00000000000000000000000000000000000000000000000000000000
0000ddddddd000000000d727727d0000000ddd7777777d000057777d7d7750000000049f00000000000000000000000000000000000000000000000000000000
000d7777777d00000000d777777d000000d7777777777d000057557575d775000000049f00000000000000000000000000000000000000000000000000000000
00d777777777d0000000d675576d00000d777777777777d000566666666650000000049f00000000000000000000000000000000000000000000000000000000
0d76667667777d0000000d6666d00000d76667776667666d00555555555500000000049f00000000000000000000000000000000000000000000000000000000
00000000000000000000d777777d0000000000000000000000000444000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000d777777d000000000000000000000000049f000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000d77774777d000000000000000000000000495555000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000d77777777d000000000000000000000005557575000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000d67774776d000006770000066770000057556665000000000000000000000000000000000000000000000000000000000000000000000
0000670000667700000d67777776d000056567000556567000566665555000000000000000000000000000000000000000000000000000000000000000000000
0005567005565670000d66774766d000055556705555556000055554000000000000000000000000000000000000000000000000000000000000000000000000
00555560055555600000d666666d000005555560555555500000044f000000000000000000000000000000000000000000000000000000000000000000000000
d666d000000000000d66d500d6666d0000000000d666d500d6666666666666666666d500d6666666666666666666d50000000000000000000000000000000000
666666000000000076666d00666666600000000766666d00666666666666666666666d00666666666666666666666d0000000000000000000000000000000000
e88888800000000e88888200e8888888000000e888888200e88888888888888888888200e8888888888888888888820000000000000000000000000000000000
e8888888000000e888888200e888888880000e8888888200e88888888888888888888200e88888899e9eeeeee8ee820000000000000000000000000000000000
76666666d0000d6666666d00766666666d00d66666666d00766666677779799766666d0076666662222222222222220000000000000000000000000000000000
766666666666666666666d00766666666666666666666d0076666662222222e966666d0076666662222222222222220000000000000000000000000000000000
2e8888888888888888888200e88888888888888888888200e8888882222222298888820098888882222222222222240000000000000000000000000000000000
22e888888888888888882200e88888888888888888888200e88888822222222e88888200e8888880000000000000000000000000000000000000000000000000
422766666666666666622400766666626666662766666d00766666600000000766666d00766666666666666666666d0000000000000000000000000000000000
022276666666666666222000766666622776622766666d00766666600000000766666d00966666666666666666666d0000000000000000000000000000000000
0022e8888888888888220000e88888842222224e88888200e88888820000002e888882009e888888888888888888820000000000000000000000000000000000
0002e8888888888888200000e88888802222220e88888200e88888888888888888888200999e9eeeeeee9e99e888820000000000000000000000000000000000
000666666666666666600000766666600222400766666d00766666666666666666666d009e8828222222222e96666d0000000000000000000000000000000000
006666666666666666660000766666600000000766666d00766666666666666666666d00e88282222222222296666d0000000000000000000000000000000000
088888888888888888888000e88888800000000e88888200e8888888888888888888820028282222222222229888820000000000000000000000000000000000
888888888888888888888400e88888800000000e88888200e88888899e9ee8e8888882000000000000000000e888820000000000000000000000000000000000
966666666222296666666200966666600000000966666d00966666622222228766666d00966666666666666666666d0000000000000000000000000000000000
766666662222227666666200766666600000000766666d00766666622222222766666d00766666666666666666666d0000000000000000000000000000000000
98888882222222298888820098888880000000098888820098888882222222498888820098888888888888888888820000000000000000000000000000000000
9e88882220000222988882009e88888000000009e88882009e88888000000009e88882009e888888888888888888820000000000000000000000000000000000
999e922200000022299e9200999e9ee00000000999e9e200999e9ee00000000999e9e200999e9eeeeeeeeeeeee8e820000000000000000000000000000000000
9e88228000000002222222009e88282000000009e88282009e88282000000009e88282009e882822222222222222220000000000000000000000000000000000
e88228000000000022222200e88282200000000e88282200e88282200000000e88282200e8828222222222222222220000000000000000000000000000000000
28228000000000000222240028282240000000028282240028282240000000028282240028282222222222222222240000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
01000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
01000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
00010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
00010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
11101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110111011101110
01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
1110111011101110d666d110111011101d66d510d6666d1011101110d666d510d6666666666666666666d510d6666666666666666666d5101110111011101110
0101010101010101666666010101010176666d01666666610101010766666d01666666666666666666666d01666666666666666666666d010101010101010101
1011101110111011e88888811011101e88888211e8888888101110e888888211e88888888888888888888211e888888888888888888882111011101110111011
0101010101010101e8888888010101e888888201e888888881010e8888888201e88888888888888888888201e88888899e9eeeeee8ee82010101010101010101
111111111111111176666666d1111d6666666d11766666666d11d66666666d11766666677779799766666d117666666222222222222222111111111111111111
0101010101010101766666666666666666666d01766666666666666666666d0176666662222222e966666d017666666222222222222222010101010101010101
11111111111111112e8888888888888888888211e88888888888888888888211e888888222222229888882119888888222222222222224111111111111111111
010101010101010122e888888888888888882201e88888888888888888888201e88888822222222e88888201e888888101010101010101010101010101010101
1111111111111111422766666666666666622411766666626666662766666d11766666611111111766666d11766666666666666666666d111111111111111111
1101110111011101122276666666666666222101766666622776622766666d01766666611101110766666d01966666666666666666666d011101110111011101
11111111111111111122e8888888888888221111e88888842222224e88888211e88888821111112e888882119e88888888888888888882111111111111111111
01010101010101010102e8888888888888210101e88888812222220e88888201e88888888888888888888201999e9eeeeeee9e99e88882010101010101010101
1111111111111111111666666666666666611111766666611222411766666d11766666666666666666666d119e8828222222222e96666d111111111111111111
1101110111011101116666666666666666661101766666611101110766666d01766666666666666666666d01e88282222222222296666d011101110111011101
1111111111111111188888888888888888888111e88888811111111e88888211e888888888888888888882112828222222222222988882111111111111111111
0111011101110111888888888888888888888411e88888810111011e88888211e88888899e9ee8e8888882110111011101110111e88882110111011101110111
1111111111111111966666666222296666666211966666611111111966666d11966666622222228766666d11966666666666666666666d111111111111111111
1111111111111111766666662222227666666211766666611111111766666d11766666622222222766666d11766666666666666666666d111111111111111111
11111111111111119888888222222229888882119888888111111119888882119888888222222249888882119888888888888888888882111111111111111111
11111111111111119e88882221111222988882119e88888111111119e88882119e88888111111119e88882119e88888888888888888882111111111111111111
1111111111111111999e922211111122299e9211999e9ee11111111999e9e211999e9ee11111111999e9e211999e9eeeeeeeeeeeee8e82111111111111111111
11111111111111119e88228111111112222222119e88282111111119e88282119e88282111111119e88282119e88282222222222222222111111111111111111
1111111111111111e88228111111111122222211e88282211111111e88282211e88282211111111e88282211e882822222222222222222111111111111111111
11111111111111112822811111111111122224112828224111111112828224112828224111111112828224112828222222222222222224111111111111111111
21112111211121112111211121112111211121112111211121112111211121112111211121112111211121112111211121112111211121112111211121112111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11211121112111777121177111771121112777771121772111771121177777771121112177777721117771211121112177777121177111277121112111211121
11111111111117666711766717667111177666667117667117661117766666667111111766666671116667117711111766666711766711766111111111111111
2121212121212666662166662666612176666666d12666612666717666666666d121212666dd6667276666276671217666d66d21666621666721212121212121
121112111211166666716666166662116666dddd1216666116666266666666dd121112766d11666616666d1666611266661dd211666612666611121112111211
21212121212126666661666626666127666d212121266667766661d66d66662121212166612166662666612d666721d666712121666677666621212121212121
1112111211127666d66266661666611666621777711666666666611dd1666612111211666117666d166661126666111d66677112666666666612111211121112
212121212121666626676666266661266661766667266666666666212166662121212766677666d12666612166662121dd666721666666666671212121212121
121212121212666616666662166667166662dd666616666ddd6666121266661212121666666666121666671766661277126666726666ddd66662121212121212
21212121212166662d6666612666662d666721666d2666612166662121666671212126666d6666712d666676666d276677666661666621266661212121212121
1212121212126666126666621666661266667766621666621266661212d666621212166662d666671266666666621666666666d2666612166662121212121212
212121212121d66d21d666d12d666d21dd66666dd12d66d121d66d21212666d121212d66d12d666d21d6666666d12d666666dd21d66d212d66d1212121212121
1212121212121dd2121ddd1212ddd21212ddddd21212dd12121dd212121ddd12121212dd1212ddd2121ddddddd1212dddddd12121dd21212dd12121212121212
21212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121
12121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212
22212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221
12121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212
21222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122
12121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212121212
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
12221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222122212221222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
32223222322232223222322232223222322232223222322232223222322232223222322232223222322232223222322232223222322232223222322232223222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
32323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232
23232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323
33323332333233323332333233323332333233323332333233323332333233323332333233323332333233323332333233323332333233323332333233323332
23232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33433343334333433343334333433343334333433343334333433343334333433343334333433343334333433343334333433343334333433343334333433343
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
43434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
43434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
43434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343
34333433343334333433343334333433343334333433343334333433343334333433343334333433343334333433343334333433343334333433343334333433
43434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343
34343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434
44434443444344434443444344434443444344434443444344434443444344434443444344434443444344434443444344434443444344434443444344434443
34343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434
43444344434443444344434443444344434443444344434443444344434443444344434443444344434443444344434443444344434443444344434443444344
34343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
34343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
34343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
44444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444

__gff__
0000000000000000000000000003030300000000000000000000000000000303000000000000000000000000000003030000000000010100010303000000030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000606464620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000666700000000000000006064616161646200000000000000000000006363000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000767700000000000000000063000000630000000000000000000000006363000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000680000606461616164620063000000630000006064646200000000006363000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000680000006300000063000063000000630000000063630000006064616464616462000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1e1f1e2e2f1f1e2e1e1f1e1f1e1e1f1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e
0d0d3f0d0d0d3e3e0d0d0d3e0d0d3f0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
0d0d0d3e0d0d0d0d0d0d0d3e3f0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3c3d3c3d3c3d3c3d3c3d3c3d3c3d3c3d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e1e
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d

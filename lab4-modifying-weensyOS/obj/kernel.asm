
obj/kernel.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000040000 <_kernel_start>:
   40000:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
   40007:	48 89 e5             	mov    %rsp,%rbp
   4000a:	6a 00                	push   $0x0
   4000c:	9d                   	popf
   4000d:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
   40012:	75 0d                	jne    40021 <_kernel_start+0x21>
   40014:	f7 03 04 00 00 00    	testl  $0x4,(%rbx)
   4001a:	74 05                	je     40021 <_kernel_start+0x21>
   4001c:	8b 7b 10             	mov    0x10(%rbx),%edi
   4001f:	eb 07                	jmp    40028 <_kernel_start+0x28>
   40021:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
   40028:	e9 2b 14 00 00       	jmp    41458 <kernel_start(char const*)>

000000000004002d <exception_entry_0>:
   4002d:	6a 00                	push   $0x0
   4002f:	6a 00                	push   $0x0
   40031:	e9 3c 0a 00 00       	jmp    40a72 <exception_entry()>

0000000000040036 <exception_entry_1>:
   40036:	6a 00                	push   $0x0
   40038:	6a 01                	push   $0x1
   4003a:	e9 33 0a 00 00       	jmp    40a72 <exception_entry()>

000000000004003f <exception_entry_2>:
   4003f:	6a 00                	push   $0x0
   40041:	6a 02                	push   $0x2
   40043:	e9 2a 0a 00 00       	jmp    40a72 <exception_entry()>

0000000000040048 <exception_entry_3>:
   40048:	6a 00                	push   $0x0
   4004a:	6a 03                	push   $0x3
   4004c:	e9 21 0a 00 00       	jmp    40a72 <exception_entry()>

0000000000040051 <exception_entry_4>:
   40051:	6a 00                	push   $0x0
   40053:	6a 04                	push   $0x4
   40055:	e9 18 0a 00 00       	jmp    40a72 <exception_entry()>

000000000004005a <exception_entry_5>:
   4005a:	6a 00                	push   $0x0
   4005c:	6a 05                	push   $0x5
   4005e:	e9 0f 0a 00 00       	jmp    40a72 <exception_entry()>

0000000000040063 <exception_entry_6>:
   40063:	6a 00                	push   $0x0
   40065:	6a 06                	push   $0x6
   40067:	e9 06 0a 00 00       	jmp    40a72 <exception_entry()>

000000000004006c <exception_entry_7>:
   4006c:	6a 00                	push   $0x0
   4006e:	6a 07                	push   $0x7
   40070:	e9 fd 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040075 <exception_entry_8>:
   40075:	6a 08                	push   $0x8
   40077:	e9 f6 09 00 00       	jmp    40a72 <exception_entry()>

000000000004007c <exception_entry_9>:
   4007c:	6a 00                	push   $0x0
   4007e:	6a 09                	push   $0x9
   40080:	e9 ed 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040085 <exception_entry_10>:
   40085:	6a 0a                	push   $0xa
   40087:	e9 e6 09 00 00       	jmp    40a72 <exception_entry()>

000000000004008c <exception_entry_11>:
   4008c:	6a 0b                	push   $0xb
   4008e:	e9 df 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040093 <exception_entry_12>:
   40093:	6a 0c                	push   $0xc
   40095:	e9 d8 09 00 00       	jmp    40a72 <exception_entry()>

000000000004009a <exception_entry_13>:
   4009a:	6a 0d                	push   $0xd
   4009c:	e9 d1 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400a1 <exception_entry_14>:
   400a1:	6a 0e                	push   $0xe
   400a3:	e9 ca 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400a8 <exception_entry_15>:
   400a8:	6a 00                	push   $0x0
   400aa:	6a 0f                	push   $0xf
   400ac:	e9 c1 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400b1 <exception_entry_16>:
   400b1:	6a 00                	push   $0x0
   400b3:	6a 10                	push   $0x10
   400b5:	e9 b8 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400ba <exception_entry_17>:
   400ba:	6a 11                	push   $0x11
   400bc:	e9 b1 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400c1 <exception_entry_18>:
   400c1:	6a 00                	push   $0x0
   400c3:	6a 12                	push   $0x12
   400c5:	e9 a8 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400ca <exception_entry_19>:
   400ca:	6a 00                	push   $0x0
   400cc:	6a 13                	push   $0x13
   400ce:	e9 9f 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400d3 <exception_entry_20>:
   400d3:	6a 00                	push   $0x0
   400d5:	6a 14                	push   $0x14
   400d7:	e9 96 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400dc <exception_entry_21>:
   400dc:	6a 00                	push   $0x0
   400de:	6a 15                	push   $0x15
   400e0:	e9 8d 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400e5 <exception_entry_22>:
   400e5:	6a 00                	push   $0x0
   400e7:	6a 16                	push   $0x16
   400e9:	e9 84 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400ee <exception_entry_23>:
   400ee:	6a 00                	push   $0x0
   400f0:	6a 17                	push   $0x17
   400f2:	e9 7b 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400f7 <exception_entry_24>:
   400f7:	6a 00                	push   $0x0
   400f9:	6a 18                	push   $0x18
   400fb:	e9 72 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040100 <exception_entry_25>:
   40100:	6a 00                	push   $0x0
   40102:	6a 19                	push   $0x19
   40104:	e9 69 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040109 <exception_entry_26>:
   40109:	6a 00                	push   $0x0
   4010b:	6a 1a                	push   $0x1a
   4010d:	e9 60 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040112 <exception_entry_27>:
   40112:	6a 00                	push   $0x0
   40114:	6a 1b                	push   $0x1b
   40116:	e9 57 09 00 00       	jmp    40a72 <exception_entry()>

000000000004011b <exception_entry_28>:
   4011b:	6a 00                	push   $0x0
   4011d:	6a 1c                	push   $0x1c
   4011f:	e9 4e 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040124 <exception_entry_29>:
   40124:	6a 00                	push   $0x0
   40126:	6a 1d                	push   $0x1d
   40128:	e9 45 09 00 00       	jmp    40a72 <exception_entry()>

000000000004012d <exception_entry_30>:
   4012d:	6a 00                	push   $0x0
   4012f:	6a 1e                	push   $0x1e
   40131:	e9 3c 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040136 <exception_entry_31>:
   40136:	6a 00                	push   $0x0
   40138:	6a 1f                	push   $0x1f
   4013a:	e9 33 09 00 00       	jmp    40a72 <exception_entry()>

000000000004013f <exception_entry_32>:
   4013f:	6a 00                	push   $0x0
   40141:	6a 20                	push   $0x20
   40143:	e9 2a 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040148 <exception_entry_33>:
   40148:	6a 00                	push   $0x0
   4014a:	6a 21                	push   $0x21
   4014c:	e9 21 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040151 <exception_entry_34>:
   40151:	6a 00                	push   $0x0
   40153:	6a 22                	push   $0x22
   40155:	e9 18 09 00 00       	jmp    40a72 <exception_entry()>

000000000004015a <exception_entry_35>:
   4015a:	6a 00                	push   $0x0
   4015c:	6a 23                	push   $0x23
   4015e:	e9 0f 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040163 <exception_entry_36>:
   40163:	6a 00                	push   $0x0
   40165:	6a 24                	push   $0x24
   40167:	e9 06 09 00 00       	jmp    40a72 <exception_entry()>

000000000004016c <exception_entry_37>:
   4016c:	6a 00                	push   $0x0
   4016e:	6a 25                	push   $0x25
   40170:	e9 fd 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040175 <exception_entry_38>:
   40175:	6a 00                	push   $0x0
   40177:	6a 26                	push   $0x26
   40179:	e9 f4 08 00 00       	jmp    40a72 <exception_entry()>

000000000004017e <exception_entry_39>:
   4017e:	6a 00                	push   $0x0
   40180:	6a 27                	push   $0x27
   40182:	e9 eb 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040187 <exception_entry_40>:
   40187:	6a 00                	push   $0x0
   40189:	6a 28                	push   $0x28
   4018b:	e9 e2 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040190 <exception_entry_41>:
   40190:	6a 00                	push   $0x0
   40192:	6a 29                	push   $0x29
   40194:	e9 d9 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040199 <exception_entry_42>:
   40199:	6a 00                	push   $0x0
   4019b:	6a 2a                	push   $0x2a
   4019d:	e9 d0 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401a2 <exception_entry_43>:
   401a2:	6a 00                	push   $0x0
   401a4:	6a 2b                	push   $0x2b
   401a6:	e9 c7 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401ab <exception_entry_44>:
   401ab:	6a 00                	push   $0x0
   401ad:	6a 2c                	push   $0x2c
   401af:	e9 be 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401b4 <exception_entry_45>:
   401b4:	6a 00                	push   $0x0
   401b6:	6a 2d                	push   $0x2d
   401b8:	e9 b5 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401bd <exception_entry_46>:
   401bd:	6a 00                	push   $0x0
   401bf:	6a 2e                	push   $0x2e
   401c1:	e9 ac 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401c6 <exception_entry_47>:
   401c6:	6a 00                	push   $0x0
   401c8:	6a 2f                	push   $0x2f
   401ca:	e9 a3 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401cf <exception_entry_48>:
   401cf:	6a 00                	push   $0x0
   401d1:	6a 30                	push   $0x30
   401d3:	e9 9a 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401d8 <exception_entry_49>:
   401d8:	6a 00                	push   $0x0
   401da:	6a 31                	push   $0x31
   401dc:	e9 91 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401e1 <exception_entry_50>:
   401e1:	6a 00                	push   $0x0
   401e3:	6a 32                	push   $0x32
   401e5:	e9 88 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401ea <exception_entry_51>:
   401ea:	6a 00                	push   $0x0
   401ec:	6a 33                	push   $0x33
   401ee:	e9 7f 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401f3 <exception_entry_52>:
   401f3:	6a 00                	push   $0x0
   401f5:	6a 34                	push   $0x34
   401f7:	e9 76 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401fc <exception_entry_53>:
   401fc:	6a 00                	push   $0x0
   401fe:	6a 35                	push   $0x35
   40200:	e9 6d 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040205 <exception_entry_54>:
   40205:	6a 00                	push   $0x0
   40207:	6a 36                	push   $0x36
   40209:	e9 64 08 00 00       	jmp    40a72 <exception_entry()>

000000000004020e <exception_entry_55>:
   4020e:	6a 00                	push   $0x0
   40210:	6a 37                	push   $0x37
   40212:	e9 5b 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040217 <exception_entry_56>:
   40217:	6a 00                	push   $0x0
   40219:	6a 38                	push   $0x38
   4021b:	e9 52 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040220 <exception_entry_57>:
   40220:	6a 00                	push   $0x0
   40222:	6a 39                	push   $0x39
   40224:	e9 49 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040229 <exception_entry_58>:
   40229:	6a 00                	push   $0x0
   4022b:	6a 3a                	push   $0x3a
   4022d:	e9 40 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040232 <exception_entry_59>:
   40232:	6a 00                	push   $0x0
   40234:	6a 3b                	push   $0x3b
   40236:	e9 37 08 00 00       	jmp    40a72 <exception_entry()>

000000000004023b <exception_entry_60>:
   4023b:	6a 00                	push   $0x0
   4023d:	6a 3c                	push   $0x3c
   4023f:	e9 2e 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040244 <exception_entry_61>:
   40244:	6a 00                	push   $0x0
   40246:	6a 3d                	push   $0x3d
   40248:	e9 25 08 00 00       	jmp    40a72 <exception_entry()>

000000000004024d <exception_entry_62>:
   4024d:	6a 00                	push   $0x0
   4024f:	6a 3e                	push   $0x3e
   40251:	e9 1c 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040256 <exception_entry_63>:
   40256:	6a 00                	push   $0x0
   40258:	6a 3f                	push   $0x3f
   4025a:	e9 13 08 00 00       	jmp    40a72 <exception_entry()>

000000000004025f <exception_entry_64>:
   4025f:	6a 00                	push   $0x0
   40261:	6a 40                	push   $0x40
   40263:	e9 0a 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040268 <exception_entry_65>:
   40268:	6a 00                	push   $0x0
   4026a:	6a 41                	push   $0x41
   4026c:	e9 01 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040271 <exception_entry_66>:
   40271:	6a 00                	push   $0x0
   40273:	6a 42                	push   $0x42
   40275:	e9 f8 07 00 00       	jmp    40a72 <exception_entry()>

000000000004027a <exception_entry_67>:
   4027a:	6a 00                	push   $0x0
   4027c:	6a 43                	push   $0x43
   4027e:	e9 ef 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040283 <exception_entry_68>:
   40283:	6a 00                	push   $0x0
   40285:	6a 44                	push   $0x44
   40287:	e9 e6 07 00 00       	jmp    40a72 <exception_entry()>

000000000004028c <exception_entry_69>:
   4028c:	6a 00                	push   $0x0
   4028e:	6a 45                	push   $0x45
   40290:	e9 dd 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040295 <exception_entry_70>:
   40295:	6a 00                	push   $0x0
   40297:	6a 46                	push   $0x46
   40299:	e9 d4 07 00 00       	jmp    40a72 <exception_entry()>

000000000004029e <exception_entry_71>:
   4029e:	6a 00                	push   $0x0
   402a0:	6a 47                	push   $0x47
   402a2:	e9 cb 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402a7 <exception_entry_72>:
   402a7:	6a 00                	push   $0x0
   402a9:	6a 48                	push   $0x48
   402ab:	e9 c2 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402b0 <exception_entry_73>:
   402b0:	6a 00                	push   $0x0
   402b2:	6a 49                	push   $0x49
   402b4:	e9 b9 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402b9 <exception_entry_74>:
   402b9:	6a 00                	push   $0x0
   402bb:	6a 4a                	push   $0x4a
   402bd:	e9 b0 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402c2 <exception_entry_75>:
   402c2:	6a 00                	push   $0x0
   402c4:	6a 4b                	push   $0x4b
   402c6:	e9 a7 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402cb <exception_entry_76>:
   402cb:	6a 00                	push   $0x0
   402cd:	6a 4c                	push   $0x4c
   402cf:	e9 9e 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402d4 <exception_entry_77>:
   402d4:	6a 00                	push   $0x0
   402d6:	6a 4d                	push   $0x4d
   402d8:	e9 95 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402dd <exception_entry_78>:
   402dd:	6a 00                	push   $0x0
   402df:	6a 4e                	push   $0x4e
   402e1:	e9 8c 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402e6 <exception_entry_79>:
   402e6:	6a 00                	push   $0x0
   402e8:	6a 4f                	push   $0x4f
   402ea:	e9 83 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402ef <exception_entry_80>:
   402ef:	6a 00                	push   $0x0
   402f1:	6a 50                	push   $0x50
   402f3:	e9 7a 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402f8 <exception_entry_81>:
   402f8:	6a 00                	push   $0x0
   402fa:	6a 51                	push   $0x51
   402fc:	e9 71 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040301 <exception_entry_82>:
   40301:	6a 00                	push   $0x0
   40303:	6a 52                	push   $0x52
   40305:	e9 68 07 00 00       	jmp    40a72 <exception_entry()>

000000000004030a <exception_entry_83>:
   4030a:	6a 00                	push   $0x0
   4030c:	6a 53                	push   $0x53
   4030e:	e9 5f 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040313 <exception_entry_84>:
   40313:	6a 00                	push   $0x0
   40315:	6a 54                	push   $0x54
   40317:	e9 56 07 00 00       	jmp    40a72 <exception_entry()>

000000000004031c <exception_entry_85>:
   4031c:	6a 00                	push   $0x0
   4031e:	6a 55                	push   $0x55
   40320:	e9 4d 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040325 <exception_entry_86>:
   40325:	6a 00                	push   $0x0
   40327:	6a 56                	push   $0x56
   40329:	e9 44 07 00 00       	jmp    40a72 <exception_entry()>

000000000004032e <exception_entry_87>:
   4032e:	6a 00                	push   $0x0
   40330:	6a 57                	push   $0x57
   40332:	e9 3b 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040337 <exception_entry_88>:
   40337:	6a 00                	push   $0x0
   40339:	6a 58                	push   $0x58
   4033b:	e9 32 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040340 <exception_entry_89>:
   40340:	6a 00                	push   $0x0
   40342:	6a 59                	push   $0x59
   40344:	e9 29 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040349 <exception_entry_90>:
   40349:	6a 00                	push   $0x0
   4034b:	6a 5a                	push   $0x5a
   4034d:	e9 20 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040352 <exception_entry_91>:
   40352:	6a 00                	push   $0x0
   40354:	6a 5b                	push   $0x5b
   40356:	e9 17 07 00 00       	jmp    40a72 <exception_entry()>

000000000004035b <exception_entry_92>:
   4035b:	6a 00                	push   $0x0
   4035d:	6a 5c                	push   $0x5c
   4035f:	e9 0e 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040364 <exception_entry_93>:
   40364:	6a 00                	push   $0x0
   40366:	6a 5d                	push   $0x5d
   40368:	e9 05 07 00 00       	jmp    40a72 <exception_entry()>

000000000004036d <exception_entry_94>:
   4036d:	6a 00                	push   $0x0
   4036f:	6a 5e                	push   $0x5e
   40371:	e9 fc 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040376 <exception_entry_95>:
   40376:	6a 00                	push   $0x0
   40378:	6a 5f                	push   $0x5f
   4037a:	e9 f3 06 00 00       	jmp    40a72 <exception_entry()>

000000000004037f <exception_entry_96>:
   4037f:	6a 00                	push   $0x0
   40381:	6a 60                	push   $0x60
   40383:	e9 ea 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040388 <exception_entry_97>:
   40388:	6a 00                	push   $0x0
   4038a:	6a 61                	push   $0x61
   4038c:	e9 e1 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040391 <exception_entry_98>:
   40391:	6a 00                	push   $0x0
   40393:	6a 62                	push   $0x62
   40395:	e9 d8 06 00 00       	jmp    40a72 <exception_entry()>

000000000004039a <exception_entry_99>:
   4039a:	6a 00                	push   $0x0
   4039c:	6a 63                	push   $0x63
   4039e:	e9 cf 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403a3 <exception_entry_100>:
   403a3:	6a 00                	push   $0x0
   403a5:	6a 64                	push   $0x64
   403a7:	e9 c6 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403ac <exception_entry_101>:
   403ac:	6a 00                	push   $0x0
   403ae:	6a 65                	push   $0x65
   403b0:	e9 bd 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403b5 <exception_entry_102>:
   403b5:	6a 00                	push   $0x0
   403b7:	6a 66                	push   $0x66
   403b9:	e9 b4 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403be <exception_entry_103>:
   403be:	6a 00                	push   $0x0
   403c0:	6a 67                	push   $0x67
   403c2:	e9 ab 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403c7 <exception_entry_104>:
   403c7:	6a 00                	push   $0x0
   403c9:	6a 68                	push   $0x68
   403cb:	e9 a2 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403d0 <exception_entry_105>:
   403d0:	6a 00                	push   $0x0
   403d2:	6a 69                	push   $0x69
   403d4:	e9 99 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403d9 <exception_entry_106>:
   403d9:	6a 00                	push   $0x0
   403db:	6a 6a                	push   $0x6a
   403dd:	e9 90 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403e2 <exception_entry_107>:
   403e2:	6a 00                	push   $0x0
   403e4:	6a 6b                	push   $0x6b
   403e6:	e9 87 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403eb <exception_entry_108>:
   403eb:	6a 00                	push   $0x0
   403ed:	6a 6c                	push   $0x6c
   403ef:	e9 7e 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403f4 <exception_entry_109>:
   403f4:	6a 00                	push   $0x0
   403f6:	6a 6d                	push   $0x6d
   403f8:	e9 75 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403fd <exception_entry_110>:
   403fd:	6a 00                	push   $0x0
   403ff:	6a 6e                	push   $0x6e
   40401:	e9 6c 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040406 <exception_entry_111>:
   40406:	6a 00                	push   $0x0
   40408:	6a 6f                	push   $0x6f
   4040a:	e9 63 06 00 00       	jmp    40a72 <exception_entry()>

000000000004040f <exception_entry_112>:
   4040f:	6a 00                	push   $0x0
   40411:	6a 70                	push   $0x70
   40413:	e9 5a 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040418 <exception_entry_113>:
   40418:	6a 00                	push   $0x0
   4041a:	6a 71                	push   $0x71
   4041c:	e9 51 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040421 <exception_entry_114>:
   40421:	6a 00                	push   $0x0
   40423:	6a 72                	push   $0x72
   40425:	e9 48 06 00 00       	jmp    40a72 <exception_entry()>

000000000004042a <exception_entry_115>:
   4042a:	6a 00                	push   $0x0
   4042c:	6a 73                	push   $0x73
   4042e:	e9 3f 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040433 <exception_entry_116>:
   40433:	6a 00                	push   $0x0
   40435:	6a 74                	push   $0x74
   40437:	e9 36 06 00 00       	jmp    40a72 <exception_entry()>

000000000004043c <exception_entry_117>:
   4043c:	6a 00                	push   $0x0
   4043e:	6a 75                	push   $0x75
   40440:	e9 2d 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040445 <exception_entry_118>:
   40445:	6a 00                	push   $0x0
   40447:	6a 76                	push   $0x76
   40449:	e9 24 06 00 00       	jmp    40a72 <exception_entry()>

000000000004044e <exception_entry_119>:
   4044e:	6a 00                	push   $0x0
   40450:	6a 77                	push   $0x77
   40452:	e9 1b 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040457 <exception_entry_120>:
   40457:	6a 00                	push   $0x0
   40459:	6a 78                	push   $0x78
   4045b:	e9 12 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040460 <exception_entry_121>:
   40460:	6a 00                	push   $0x0
   40462:	6a 79                	push   $0x79
   40464:	e9 09 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040469 <exception_entry_122>:
   40469:	6a 00                	push   $0x0
   4046b:	6a 7a                	push   $0x7a
   4046d:	e9 00 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040472 <exception_entry_123>:
   40472:	6a 00                	push   $0x0
   40474:	6a 7b                	push   $0x7b
   40476:	e9 f7 05 00 00       	jmp    40a72 <exception_entry()>

000000000004047b <exception_entry_124>:
   4047b:	6a 00                	push   $0x0
   4047d:	6a 7c                	push   $0x7c
   4047f:	e9 ee 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040484 <exception_entry_125>:
   40484:	6a 00                	push   $0x0
   40486:	6a 7d                	push   $0x7d
   40488:	e9 e5 05 00 00       	jmp    40a72 <exception_entry()>

000000000004048d <exception_entry_126>:
   4048d:	6a 00                	push   $0x0
   4048f:	6a 7e                	push   $0x7e
   40491:	e9 dc 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040496 <exception_entry_127>:
   40496:	6a 00                	push   $0x0
   40498:	6a 7f                	push   $0x7f
   4049a:	e9 d3 05 00 00       	jmp    40a72 <exception_entry()>

000000000004049f <exception_entry_128>:
   4049f:	6a 00                	push   $0x0
   404a1:	68 80 00 00 00       	push   $0x80
   404a6:	e9 c7 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404ab <exception_entry_129>:
   404ab:	6a 00                	push   $0x0
   404ad:	68 81 00 00 00       	push   $0x81
   404b2:	e9 bb 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404b7 <exception_entry_130>:
   404b7:	6a 00                	push   $0x0
   404b9:	68 82 00 00 00       	push   $0x82
   404be:	e9 af 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404c3 <exception_entry_131>:
   404c3:	6a 00                	push   $0x0
   404c5:	68 83 00 00 00       	push   $0x83
   404ca:	e9 a3 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404cf <exception_entry_132>:
   404cf:	6a 00                	push   $0x0
   404d1:	68 84 00 00 00       	push   $0x84
   404d6:	e9 97 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404db <exception_entry_133>:
   404db:	6a 00                	push   $0x0
   404dd:	68 85 00 00 00       	push   $0x85
   404e2:	e9 8b 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404e7 <exception_entry_134>:
   404e7:	6a 00                	push   $0x0
   404e9:	68 86 00 00 00       	push   $0x86
   404ee:	e9 7f 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404f3 <exception_entry_135>:
   404f3:	6a 00                	push   $0x0
   404f5:	68 87 00 00 00       	push   $0x87
   404fa:	e9 73 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404ff <exception_entry_136>:
   404ff:	6a 00                	push   $0x0
   40501:	68 88 00 00 00       	push   $0x88
   40506:	e9 67 05 00 00       	jmp    40a72 <exception_entry()>

000000000004050b <exception_entry_137>:
   4050b:	6a 00                	push   $0x0
   4050d:	68 89 00 00 00       	push   $0x89
   40512:	e9 5b 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040517 <exception_entry_138>:
   40517:	6a 00                	push   $0x0
   40519:	68 8a 00 00 00       	push   $0x8a
   4051e:	e9 4f 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040523 <exception_entry_139>:
   40523:	6a 00                	push   $0x0
   40525:	68 8b 00 00 00       	push   $0x8b
   4052a:	e9 43 05 00 00       	jmp    40a72 <exception_entry()>

000000000004052f <exception_entry_140>:
   4052f:	6a 00                	push   $0x0
   40531:	68 8c 00 00 00       	push   $0x8c
   40536:	e9 37 05 00 00       	jmp    40a72 <exception_entry()>

000000000004053b <exception_entry_141>:
   4053b:	6a 00                	push   $0x0
   4053d:	68 8d 00 00 00       	push   $0x8d
   40542:	e9 2b 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040547 <exception_entry_142>:
   40547:	6a 00                	push   $0x0
   40549:	68 8e 00 00 00       	push   $0x8e
   4054e:	e9 1f 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040553 <exception_entry_143>:
   40553:	6a 00                	push   $0x0
   40555:	68 8f 00 00 00       	push   $0x8f
   4055a:	e9 13 05 00 00       	jmp    40a72 <exception_entry()>

000000000004055f <exception_entry_144>:
   4055f:	6a 00                	push   $0x0
   40561:	68 90 00 00 00       	push   $0x90
   40566:	e9 07 05 00 00       	jmp    40a72 <exception_entry()>

000000000004056b <exception_entry_145>:
   4056b:	6a 00                	push   $0x0
   4056d:	68 91 00 00 00       	push   $0x91
   40572:	e9 fb 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040577 <exception_entry_146>:
   40577:	6a 00                	push   $0x0
   40579:	68 92 00 00 00       	push   $0x92
   4057e:	e9 ef 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040583 <exception_entry_147>:
   40583:	6a 00                	push   $0x0
   40585:	68 93 00 00 00       	push   $0x93
   4058a:	e9 e3 04 00 00       	jmp    40a72 <exception_entry()>

000000000004058f <exception_entry_148>:
   4058f:	6a 00                	push   $0x0
   40591:	68 94 00 00 00       	push   $0x94
   40596:	e9 d7 04 00 00       	jmp    40a72 <exception_entry()>

000000000004059b <exception_entry_149>:
   4059b:	6a 00                	push   $0x0
   4059d:	68 95 00 00 00       	push   $0x95
   405a2:	e9 cb 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405a7 <exception_entry_150>:
   405a7:	6a 00                	push   $0x0
   405a9:	68 96 00 00 00       	push   $0x96
   405ae:	e9 bf 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405b3 <exception_entry_151>:
   405b3:	6a 00                	push   $0x0
   405b5:	68 97 00 00 00       	push   $0x97
   405ba:	e9 b3 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405bf <exception_entry_152>:
   405bf:	6a 00                	push   $0x0
   405c1:	68 98 00 00 00       	push   $0x98
   405c6:	e9 a7 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405cb <exception_entry_153>:
   405cb:	6a 00                	push   $0x0
   405cd:	68 99 00 00 00       	push   $0x99
   405d2:	e9 9b 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405d7 <exception_entry_154>:
   405d7:	6a 00                	push   $0x0
   405d9:	68 9a 00 00 00       	push   $0x9a
   405de:	e9 8f 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405e3 <exception_entry_155>:
   405e3:	6a 00                	push   $0x0
   405e5:	68 9b 00 00 00       	push   $0x9b
   405ea:	e9 83 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405ef <exception_entry_156>:
   405ef:	6a 00                	push   $0x0
   405f1:	68 9c 00 00 00       	push   $0x9c
   405f6:	e9 77 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405fb <exception_entry_157>:
   405fb:	6a 00                	push   $0x0
   405fd:	68 9d 00 00 00       	push   $0x9d
   40602:	e9 6b 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040607 <exception_entry_158>:
   40607:	6a 00                	push   $0x0
   40609:	68 9e 00 00 00       	push   $0x9e
   4060e:	e9 5f 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040613 <exception_entry_159>:
   40613:	6a 00                	push   $0x0
   40615:	68 9f 00 00 00       	push   $0x9f
   4061a:	e9 53 04 00 00       	jmp    40a72 <exception_entry()>

000000000004061f <exception_entry_160>:
   4061f:	6a 00                	push   $0x0
   40621:	68 a0 00 00 00       	push   $0xa0
   40626:	e9 47 04 00 00       	jmp    40a72 <exception_entry()>

000000000004062b <exception_entry_161>:
   4062b:	6a 00                	push   $0x0
   4062d:	68 a1 00 00 00       	push   $0xa1
   40632:	e9 3b 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040637 <exception_entry_162>:
   40637:	6a 00                	push   $0x0
   40639:	68 a2 00 00 00       	push   $0xa2
   4063e:	e9 2f 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040643 <exception_entry_163>:
   40643:	6a 00                	push   $0x0
   40645:	68 a3 00 00 00       	push   $0xa3
   4064a:	e9 23 04 00 00       	jmp    40a72 <exception_entry()>

000000000004064f <exception_entry_164>:
   4064f:	6a 00                	push   $0x0
   40651:	68 a4 00 00 00       	push   $0xa4
   40656:	e9 17 04 00 00       	jmp    40a72 <exception_entry()>

000000000004065b <exception_entry_165>:
   4065b:	6a 00                	push   $0x0
   4065d:	68 a5 00 00 00       	push   $0xa5
   40662:	e9 0b 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040667 <exception_entry_166>:
   40667:	6a 00                	push   $0x0
   40669:	68 a6 00 00 00       	push   $0xa6
   4066e:	e9 ff 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040673 <exception_entry_167>:
   40673:	6a 00                	push   $0x0
   40675:	68 a7 00 00 00       	push   $0xa7
   4067a:	e9 f3 03 00 00       	jmp    40a72 <exception_entry()>

000000000004067f <exception_entry_168>:
   4067f:	6a 00                	push   $0x0
   40681:	68 a8 00 00 00       	push   $0xa8
   40686:	e9 e7 03 00 00       	jmp    40a72 <exception_entry()>

000000000004068b <exception_entry_169>:
   4068b:	6a 00                	push   $0x0
   4068d:	68 a9 00 00 00       	push   $0xa9
   40692:	e9 db 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040697 <exception_entry_170>:
   40697:	6a 00                	push   $0x0
   40699:	68 aa 00 00 00       	push   $0xaa
   4069e:	e9 cf 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406a3 <exception_entry_171>:
   406a3:	6a 00                	push   $0x0
   406a5:	68 ab 00 00 00       	push   $0xab
   406aa:	e9 c3 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406af <exception_entry_172>:
   406af:	6a 00                	push   $0x0
   406b1:	68 ac 00 00 00       	push   $0xac
   406b6:	e9 b7 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406bb <exception_entry_173>:
   406bb:	6a 00                	push   $0x0
   406bd:	68 ad 00 00 00       	push   $0xad
   406c2:	e9 ab 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406c7 <exception_entry_174>:
   406c7:	6a 00                	push   $0x0
   406c9:	68 ae 00 00 00       	push   $0xae
   406ce:	e9 9f 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406d3 <exception_entry_175>:
   406d3:	6a 00                	push   $0x0
   406d5:	68 af 00 00 00       	push   $0xaf
   406da:	e9 93 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406df <exception_entry_176>:
   406df:	6a 00                	push   $0x0
   406e1:	68 b0 00 00 00       	push   $0xb0
   406e6:	e9 87 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406eb <exception_entry_177>:
   406eb:	6a 00                	push   $0x0
   406ed:	68 b1 00 00 00       	push   $0xb1
   406f2:	e9 7b 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406f7 <exception_entry_178>:
   406f7:	6a 00                	push   $0x0
   406f9:	68 b2 00 00 00       	push   $0xb2
   406fe:	e9 6f 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040703 <exception_entry_179>:
   40703:	6a 00                	push   $0x0
   40705:	68 b3 00 00 00       	push   $0xb3
   4070a:	e9 63 03 00 00       	jmp    40a72 <exception_entry()>

000000000004070f <exception_entry_180>:
   4070f:	6a 00                	push   $0x0
   40711:	68 b4 00 00 00       	push   $0xb4
   40716:	e9 57 03 00 00       	jmp    40a72 <exception_entry()>

000000000004071b <exception_entry_181>:
   4071b:	6a 00                	push   $0x0
   4071d:	68 b5 00 00 00       	push   $0xb5
   40722:	e9 4b 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040727 <exception_entry_182>:
   40727:	6a 00                	push   $0x0
   40729:	68 b6 00 00 00       	push   $0xb6
   4072e:	e9 3f 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040733 <exception_entry_183>:
   40733:	6a 00                	push   $0x0
   40735:	68 b7 00 00 00       	push   $0xb7
   4073a:	e9 33 03 00 00       	jmp    40a72 <exception_entry()>

000000000004073f <exception_entry_184>:
   4073f:	6a 00                	push   $0x0
   40741:	68 b8 00 00 00       	push   $0xb8
   40746:	e9 27 03 00 00       	jmp    40a72 <exception_entry()>

000000000004074b <exception_entry_185>:
   4074b:	6a 00                	push   $0x0
   4074d:	68 b9 00 00 00       	push   $0xb9
   40752:	e9 1b 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040757 <exception_entry_186>:
   40757:	6a 00                	push   $0x0
   40759:	68 ba 00 00 00       	push   $0xba
   4075e:	e9 0f 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040763 <exception_entry_187>:
   40763:	6a 00                	push   $0x0
   40765:	68 bb 00 00 00       	push   $0xbb
   4076a:	e9 03 03 00 00       	jmp    40a72 <exception_entry()>

000000000004076f <exception_entry_188>:
   4076f:	6a 00                	push   $0x0
   40771:	68 bc 00 00 00       	push   $0xbc
   40776:	e9 f7 02 00 00       	jmp    40a72 <exception_entry()>

000000000004077b <exception_entry_189>:
   4077b:	6a 00                	push   $0x0
   4077d:	68 bd 00 00 00       	push   $0xbd
   40782:	e9 eb 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040787 <exception_entry_190>:
   40787:	6a 00                	push   $0x0
   40789:	68 be 00 00 00       	push   $0xbe
   4078e:	e9 df 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040793 <exception_entry_191>:
   40793:	6a 00                	push   $0x0
   40795:	68 bf 00 00 00       	push   $0xbf
   4079a:	e9 d3 02 00 00       	jmp    40a72 <exception_entry()>

000000000004079f <exception_entry_192>:
   4079f:	6a 00                	push   $0x0
   407a1:	68 c0 00 00 00       	push   $0xc0
   407a6:	e9 c7 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407ab <exception_entry_193>:
   407ab:	6a 00                	push   $0x0
   407ad:	68 c1 00 00 00       	push   $0xc1
   407b2:	e9 bb 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407b7 <exception_entry_194>:
   407b7:	6a 00                	push   $0x0
   407b9:	68 c2 00 00 00       	push   $0xc2
   407be:	e9 af 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407c3 <exception_entry_195>:
   407c3:	6a 00                	push   $0x0
   407c5:	68 c3 00 00 00       	push   $0xc3
   407ca:	e9 a3 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407cf <exception_entry_196>:
   407cf:	6a 00                	push   $0x0
   407d1:	68 c4 00 00 00       	push   $0xc4
   407d6:	e9 97 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407db <exception_entry_197>:
   407db:	6a 00                	push   $0x0
   407dd:	68 c5 00 00 00       	push   $0xc5
   407e2:	e9 8b 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407e7 <exception_entry_198>:
   407e7:	6a 00                	push   $0x0
   407e9:	68 c6 00 00 00       	push   $0xc6
   407ee:	e9 7f 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407f3 <exception_entry_199>:
   407f3:	6a 00                	push   $0x0
   407f5:	68 c7 00 00 00       	push   $0xc7
   407fa:	e9 73 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407ff <exception_entry_200>:
   407ff:	6a 00                	push   $0x0
   40801:	68 c8 00 00 00       	push   $0xc8
   40806:	e9 67 02 00 00       	jmp    40a72 <exception_entry()>

000000000004080b <exception_entry_201>:
   4080b:	6a 00                	push   $0x0
   4080d:	68 c9 00 00 00       	push   $0xc9
   40812:	e9 5b 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040817 <exception_entry_202>:
   40817:	6a 00                	push   $0x0
   40819:	68 ca 00 00 00       	push   $0xca
   4081e:	e9 4f 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040823 <exception_entry_203>:
   40823:	6a 00                	push   $0x0
   40825:	68 cb 00 00 00       	push   $0xcb
   4082a:	e9 43 02 00 00       	jmp    40a72 <exception_entry()>

000000000004082f <exception_entry_204>:
   4082f:	6a 00                	push   $0x0
   40831:	68 cc 00 00 00       	push   $0xcc
   40836:	e9 37 02 00 00       	jmp    40a72 <exception_entry()>

000000000004083b <exception_entry_205>:
   4083b:	6a 00                	push   $0x0
   4083d:	68 cd 00 00 00       	push   $0xcd
   40842:	e9 2b 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040847 <exception_entry_206>:
   40847:	6a 00                	push   $0x0
   40849:	68 ce 00 00 00       	push   $0xce
   4084e:	e9 1f 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040853 <exception_entry_207>:
   40853:	6a 00                	push   $0x0
   40855:	68 cf 00 00 00       	push   $0xcf
   4085a:	e9 13 02 00 00       	jmp    40a72 <exception_entry()>

000000000004085f <exception_entry_208>:
   4085f:	6a 00                	push   $0x0
   40861:	68 d0 00 00 00       	push   $0xd0
   40866:	e9 07 02 00 00       	jmp    40a72 <exception_entry()>

000000000004086b <exception_entry_209>:
   4086b:	6a 00                	push   $0x0
   4086d:	68 d1 00 00 00       	push   $0xd1
   40872:	e9 fb 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040877 <exception_entry_210>:
   40877:	6a 00                	push   $0x0
   40879:	68 d2 00 00 00       	push   $0xd2
   4087e:	e9 ef 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040883 <exception_entry_211>:
   40883:	6a 00                	push   $0x0
   40885:	68 d3 00 00 00       	push   $0xd3
   4088a:	e9 e3 01 00 00       	jmp    40a72 <exception_entry()>

000000000004088f <exception_entry_212>:
   4088f:	6a 00                	push   $0x0
   40891:	68 d4 00 00 00       	push   $0xd4
   40896:	e9 d7 01 00 00       	jmp    40a72 <exception_entry()>

000000000004089b <exception_entry_213>:
   4089b:	6a 00                	push   $0x0
   4089d:	68 d5 00 00 00       	push   $0xd5
   408a2:	e9 cb 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408a7 <exception_entry_214>:
   408a7:	6a 00                	push   $0x0
   408a9:	68 d6 00 00 00       	push   $0xd6
   408ae:	e9 bf 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408b3 <exception_entry_215>:
   408b3:	6a 00                	push   $0x0
   408b5:	68 d7 00 00 00       	push   $0xd7
   408ba:	e9 b3 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408bf <exception_entry_216>:
   408bf:	6a 00                	push   $0x0
   408c1:	68 d8 00 00 00       	push   $0xd8
   408c6:	e9 a7 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408cb <exception_entry_217>:
   408cb:	6a 00                	push   $0x0
   408cd:	68 d9 00 00 00       	push   $0xd9
   408d2:	e9 9b 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408d7 <exception_entry_218>:
   408d7:	6a 00                	push   $0x0
   408d9:	68 da 00 00 00       	push   $0xda
   408de:	e9 8f 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408e3 <exception_entry_219>:
   408e3:	6a 00                	push   $0x0
   408e5:	68 db 00 00 00       	push   $0xdb
   408ea:	e9 83 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408ef <exception_entry_220>:
   408ef:	6a 00                	push   $0x0
   408f1:	68 dc 00 00 00       	push   $0xdc
   408f6:	e9 77 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408fb <exception_entry_221>:
   408fb:	6a 00                	push   $0x0
   408fd:	68 dd 00 00 00       	push   $0xdd
   40902:	e9 6b 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040907 <exception_entry_222>:
   40907:	6a 00                	push   $0x0
   40909:	68 de 00 00 00       	push   $0xde
   4090e:	e9 5f 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040913 <exception_entry_223>:
   40913:	6a 00                	push   $0x0
   40915:	68 df 00 00 00       	push   $0xdf
   4091a:	e9 53 01 00 00       	jmp    40a72 <exception_entry()>

000000000004091f <exception_entry_224>:
   4091f:	6a 00                	push   $0x0
   40921:	68 e0 00 00 00       	push   $0xe0
   40926:	e9 47 01 00 00       	jmp    40a72 <exception_entry()>

000000000004092b <exception_entry_225>:
   4092b:	6a 00                	push   $0x0
   4092d:	68 e1 00 00 00       	push   $0xe1
   40932:	e9 3b 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040937 <exception_entry_226>:
   40937:	6a 00                	push   $0x0
   40939:	68 e2 00 00 00       	push   $0xe2
   4093e:	e9 2f 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040943 <exception_entry_227>:
   40943:	6a 00                	push   $0x0
   40945:	68 e3 00 00 00       	push   $0xe3
   4094a:	e9 23 01 00 00       	jmp    40a72 <exception_entry()>

000000000004094f <exception_entry_228>:
   4094f:	6a 00                	push   $0x0
   40951:	68 e4 00 00 00       	push   $0xe4
   40956:	e9 17 01 00 00       	jmp    40a72 <exception_entry()>

000000000004095b <exception_entry_229>:
   4095b:	6a 00                	push   $0x0
   4095d:	68 e5 00 00 00       	push   $0xe5
   40962:	e9 0b 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040967 <exception_entry_230>:
   40967:	6a 00                	push   $0x0
   40969:	68 e6 00 00 00       	push   $0xe6
   4096e:	e9 ff 00 00 00       	jmp    40a72 <exception_entry()>

0000000000040973 <exception_entry_231>:
   40973:	6a 00                	push   $0x0
   40975:	68 e7 00 00 00       	push   $0xe7
   4097a:	e9 f3 00 00 00       	jmp    40a72 <exception_entry()>

000000000004097f <exception_entry_232>:
   4097f:	6a 00                	push   $0x0
   40981:	68 e8 00 00 00       	push   $0xe8
   40986:	e9 e7 00 00 00       	jmp    40a72 <exception_entry()>

000000000004098b <exception_entry_233>:
   4098b:	6a 00                	push   $0x0
   4098d:	68 e9 00 00 00       	push   $0xe9
   40992:	e9 db 00 00 00       	jmp    40a72 <exception_entry()>

0000000000040997 <exception_entry_234>:
   40997:	6a 00                	push   $0x0
   40999:	68 ea 00 00 00       	push   $0xea
   4099e:	e9 cf 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409a3 <exception_entry_235>:
   409a3:	6a 00                	push   $0x0
   409a5:	68 eb 00 00 00       	push   $0xeb
   409aa:	e9 c3 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409af <exception_entry_236>:
   409af:	6a 00                	push   $0x0
   409b1:	68 ec 00 00 00       	push   $0xec
   409b6:	e9 b7 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409bb <exception_entry_237>:
   409bb:	6a 00                	push   $0x0
   409bd:	68 ed 00 00 00       	push   $0xed
   409c2:	e9 ab 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409c7 <exception_entry_238>:
   409c7:	6a 00                	push   $0x0
   409c9:	68 ee 00 00 00       	push   $0xee
   409ce:	e9 9f 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409d3 <exception_entry_239>:
   409d3:	6a 00                	push   $0x0
   409d5:	68 ef 00 00 00       	push   $0xef
   409da:	e9 93 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409df <exception_entry_240>:
   409df:	6a 00                	push   $0x0
   409e1:	68 f0 00 00 00       	push   $0xf0
   409e6:	e9 87 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409eb <exception_entry_241>:
   409eb:	6a 00                	push   $0x0
   409ed:	68 f1 00 00 00       	push   $0xf1
   409f2:	eb 7e                	jmp    40a72 <exception_entry()>

00000000000409f4 <exception_entry_242>:
   409f4:	6a 00                	push   $0x0
   409f6:	68 f2 00 00 00       	push   $0xf2
   409fb:	eb 75                	jmp    40a72 <exception_entry()>

00000000000409fd <exception_entry_243>:
   409fd:	6a 00                	push   $0x0
   409ff:	68 f3 00 00 00       	push   $0xf3
   40a04:	eb 6c                	jmp    40a72 <exception_entry()>

0000000000040a06 <exception_entry_244>:
   40a06:	6a 00                	push   $0x0
   40a08:	68 f4 00 00 00       	push   $0xf4
   40a0d:	eb 63                	jmp    40a72 <exception_entry()>

0000000000040a0f <exception_entry_245>:
   40a0f:	6a 00                	push   $0x0
   40a11:	68 f5 00 00 00       	push   $0xf5
   40a16:	eb 5a                	jmp    40a72 <exception_entry()>

0000000000040a18 <exception_entry_246>:
   40a18:	6a 00                	push   $0x0
   40a1a:	68 f6 00 00 00       	push   $0xf6
   40a1f:	eb 51                	jmp    40a72 <exception_entry()>

0000000000040a21 <exception_entry_247>:
   40a21:	6a 00                	push   $0x0
   40a23:	68 f7 00 00 00       	push   $0xf7
   40a28:	eb 48                	jmp    40a72 <exception_entry()>

0000000000040a2a <exception_entry_248>:
   40a2a:	6a 00                	push   $0x0
   40a2c:	68 f8 00 00 00       	push   $0xf8
   40a31:	eb 3f                	jmp    40a72 <exception_entry()>

0000000000040a33 <exception_entry_249>:
   40a33:	6a 00                	push   $0x0
   40a35:	68 f9 00 00 00       	push   $0xf9
   40a3a:	eb 36                	jmp    40a72 <exception_entry()>

0000000000040a3c <exception_entry_250>:
   40a3c:	6a 00                	push   $0x0
   40a3e:	68 fa 00 00 00       	push   $0xfa
   40a43:	eb 2d                	jmp    40a72 <exception_entry()>

0000000000040a45 <exception_entry_251>:
   40a45:	6a 00                	push   $0x0
   40a47:	68 fb 00 00 00       	push   $0xfb
   40a4c:	eb 24                	jmp    40a72 <exception_entry()>

0000000000040a4e <exception_entry_252>:
   40a4e:	6a 00                	push   $0x0
   40a50:	68 fc 00 00 00       	push   $0xfc
   40a55:	eb 1b                	jmp    40a72 <exception_entry()>

0000000000040a57 <exception_entry_253>:
   40a57:	6a 00                	push   $0x0
   40a59:	68 fd 00 00 00       	push   $0xfd
   40a5e:	eb 12                	jmp    40a72 <exception_entry()>

0000000000040a60 <exception_entry_254>:
   40a60:	6a 00                	push   $0x0
   40a62:	68 fe 00 00 00       	push   $0xfe
   40a67:	eb 09                	jmp    40a72 <exception_entry()>

0000000000040a69 <exception_entry_255>:
   40a69:	6a 00                	push   $0x0
   40a6b:	68 ff 00 00 00       	push   $0xff
   40a70:	eb 00                	jmp    40a72 <exception_entry()>

0000000000040a72 <exception_entry()>:
   40a72:	0f a8                	push   %gs
   40a74:	0f a0                	push   %fs
   40a76:	41 57                	push   %r15
   40a78:	41 56                	push   %r14
   40a7a:	41 55                	push   %r13
   40a7c:	41 54                	push   %r12
   40a7e:	41 53                	push   %r11
   40a80:	41 52                	push   %r10
   40a82:	41 51                	push   %r9
   40a84:	41 50                	push   %r8
   40a86:	57                   	push   %rdi
   40a87:	56                   	push   %rsi
   40a88:	55                   	push   %rbp
   40a89:	53                   	push   %rbx
   40a8a:	52                   	push   %rdx
   40a8b:	51                   	push   %rcx
   40a8c:	50                   	push   %rax
   40a8d:	48 89 e7             	mov    %rsp,%rdi
   40a90:	48 c7 c0 00 b0 05 00 	mov    $0x5b000,%rax
   40a97:	0f 22 d8             	mov    %rax,%cr3
   40a9a:	e8 8b 0d 00 00       	call   4182a <exception(regstate*)>

0000000000040a9f <exception_return(proc*)>:
   40a9f:	8b 47 0c             	mov    0xc(%rdi),%eax
   40aa2:	83 f8 01             	cmp    $0x1,%eax
   40aa5:	0f 85 a4 00 00 00    	jne    40b4f <proc_runnable_fail>
   40aab:	48 8b 07             	mov    (%rdi),%rax
   40aae:	0f 22 d8             	mov    %rax,%cr3
   40ab1:	48 8d 67 10          	lea    0x10(%rdi),%rsp
   40ab5:	58                   	pop    %rax
   40ab6:	59                   	pop    %rcx
   40ab7:	5a                   	pop    %rdx
   40ab8:	5b                   	pop    %rbx
   40ab9:	5d                   	pop    %rbp
   40aba:	5e                   	pop    %rsi
   40abb:	5f                   	pop    %rdi
   40abc:	41 58                	pop    %r8
   40abe:	41 59                	pop    %r9
   40ac0:	41 5a                	pop    %r10
   40ac2:	41 5b                	pop    %r11
   40ac4:	41 5c                	pop    %r12
   40ac6:	41 5d                	pop    %r13
   40ac8:	41 5e                	pop    %r14
   40aca:	41 5f                	pop    %r15
   40acc:	0f a1                	pop    %fs
   40ace:	0f a9                	pop    %gs
   40ad0:	48 83 c4 10          	add    $0x10,%rsp
   40ad4:	48 cf                	iretq

0000000000040ad6 <syscall_entry()>:
   40ad6:	48 89 24 25 f0 ff 07 	mov    %rsp,0x7fff0
   40add:	00 
   40ade:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
   40ae5:	6a 23                	push   $0x23
   40ae7:	48 83 ec 08          	sub    $0x8,%rsp
   40aeb:	41 53                	push   %r11
   40aed:	6a 1b                	push   $0x1b
   40aef:	51                   	push   %rcx
   40af0:	48 83 ec 08          	sub    $0x8,%rsp
   40af4:	6a ff                	push   $0xffffffffffffffff
   40af6:	0f a8                	push   %gs
   40af8:	0f a0                	push   %fs
   40afa:	41 57                	push   %r15
   40afc:	41 56                	push   %r14
   40afe:	41 55                	push   %r13
   40b00:	41 54                	push   %r12
   40b02:	48 83 ec 08          	sub    $0x8,%rsp
   40b06:	41 52                	push   %r10
   40b08:	41 51                	push   %r9
   40b0a:	41 50                	push   %r8
   40b0c:	57                   	push   %rdi
   40b0d:	56                   	push   %rsi
   40b0e:	55                   	push   %rbp
   40b0f:	53                   	push   %rbx
   40b10:	52                   	push   %rdx
   40b11:	48 83 ec 08          	sub    $0x8,%rsp
   40b15:	50                   	push   %rax
   40b16:	48 c7 c0 00 b0 05 00 	mov    $0x5b000,%rax
   40b1d:	0f 22 d8             	mov    %rax,%cr3
   40b20:	48 89 e7             	mov    %rsp,%rdi
   40b23:	e8 28 0e 00 00       	call   41950 <syscall(regstate*)>
   40b28:	48 8b 0c 25 00 92 05 	mov    0x59200,%rcx
   40b2f:	00 
   40b30:	8b 49 0c             	mov    0xc(%rcx),%ecx
   40b33:	83 f9 01             	cmp    $0x1,%ecx
   40b36:	75 17                	jne    40b4f <proc_runnable_fail>
   40b38:	48 8b 0c 25 00 92 05 	mov    0x59200,%rcx
   40b3f:	00 
   40b40:	48 8b 09             	mov    (%rcx),%rcx
   40b43:	0f 22 d9             	mov    %rcx,%cr3
   40b46:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   40b4d:	48 cf                	iretq

0000000000040b4f <proc_runnable_fail>:
   40b4f:	31 c9                	xor    %ecx,%ecx
   40b51:	48 c7 c2 6e 55 04 00 	mov    $0x4556e,%rdx
   40b58:	31 f6                	xor    %esi,%esi
   40b5a:	48 c7 c7 60 55 04 00 	mov    $0x45560,%rdi
   40b61:	e8 be 22 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>

0000000000040b66 <vmiter::pa() const>:
    if (sz > PAGESIZE) {
        return nullptr;
    }

    for (uintptr_t pa = 0; pa != MEMSIZE_PHYSICAL; pa += PAGESIZE) {
        if (allocatable_physical_address(pa)
   40b66:	f3 0f 1e fa          	endbr64
            && physpages[pa / PAGESIZE].refcount == 0) {
   40b6a:	48 8b 47 08          	mov    0x8(%rdi),%rax
   40b6e:	48 8b 08             	mov    (%rax),%rcx
            memset((void*) pa, 0xCC, PAGESIZE);
            return (void*) pa;
        }
    }
    return nullptr;
}
   40b71:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
            && physpages[pa / PAGESIZE].refcount == 0) {
   40b78:	f6 c1 01             	test   $0x1,%cl
   40b7b:	74 2c                	je     40ba9 <vmiter::pa() const+0x43>
            memset((void*) pa, 0xCC, PAGESIZE);
   40b7d:	8b 47 10             	mov    0x10(%rdi),%eax
            return (void*) pa;
   40b80:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   40b87:	ff 0f 00 
   40b8a:	48 21 ca             	and    %rcx,%rdx
            memset((void*) pa, 0xCC, PAGESIZE);
   40b8d:	85 c0                	test   %eax,%eax
   40b8f:	7e 19                	jle    40baa <vmiter::pa() const+0x44>
// Parts of a paged address: page index, page offset
static inline int pageindex(uintptr_t addr, int level) {
    return (int) (addr >> (PAGEOFFBITS + level * PAGEINDEXBITS)) & 0x1FF;
}
static inline uintptr_t pageoffmask(int level) {
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   40b91:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
    if (*pep_ & PTE_P) {
        uintptr_t pa = *pep_ & PTE_PAMASK;
        if (level_ > 0) {
            pa &= ~0x1000UL;
        }
        return pa + (va_ & pageoffmask(level_));
   40b95:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   40b9c:	48 d3 e0             	shl    %cl,%rax
   40b9f:	48 f7 d0             	not    %rax
   40ba2:	48 23 47 18          	and    0x18(%rdi),%rax
   40ba6:	48 01 d0             	add    %rdx,%rax
    } else {
        return -1;
    }
}
   40ba9:	c3                   	ret
        uintptr_t pa = *pep_ & PTE_PAMASK;
   40baa:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   40bb1:	ff 0f 00 
   40bb4:	48 21 ca             	and    %rcx,%rdx
   40bb7:	eb d8                	jmp    40b91 <vmiter::pa() const+0x2b>

0000000000040bb9 <kalloc(unsigned long)>:
void* kalloc(size_t sz) {
   40bb9:	f3 0f 1e fa          	endbr64
   40bbd:	55                   	push   %rbp
   40bbe:	48 89 e5             	mov    %rsp,%rbp
   40bc1:	41 54                	push   %r12
   40bc3:	53                   	push   %rbx
    if (sz > PAGESIZE) {
   40bc4:	48 81 ff 00 10 00 00 	cmp    $0x1000,%rdi
   40bcb:	77 5f                	ja     40c2c <kalloc(unsigned long)+0x73>
    for (uintptr_t pa = 0; pa != MEMSIZE_PHYSICAL; pa += PAGESIZE) {
   40bcd:	bb 00 00 00 00       	mov    $0x0,%ebx
   40bd2:	eb 10                	jmp    40be4 <kalloc(unsigned long)+0x2b>
   40bd4:	48 81 c3 00 10 00 00 	add    $0x1000,%rbx
   40bdb:	48 81 fb 00 00 20 00 	cmp    $0x200000,%rbx
   40be2:	74 40                	je     40c24 <kalloc(unsigned long)+0x6b>
        if (allocatable_physical_address(pa)
   40be4:	48 89 df             	mov    %rbx,%rdi
   40be7:	e8 70 1a 00 00       	call   4265c <allocatable_physical_address(unsigned long)>
            && physpages[pa / PAGESIZE].refcount == 0) {
   40bec:	84 c0                	test   %al,%al
   40bee:	74 e4                	je     40bd4 <kalloc(unsigned long)+0x1b>
   40bf0:	48 89 d8             	mov    %rbx,%rax
   40bf3:	48 c1 e8 0c          	shr    $0xc,%rax
   40bf7:	80 b8 00 90 05 00 00 	cmpb   $0x0,0x59000(%rax)
   40bfe:	75 d4                	jne    40bd4 <kalloc(unsigned long)+0x1b>
            physpages[pa / PAGESIZE].refcount++;
   40c00:	c6 80 00 90 05 00 01 	movb   $0x1,0x59000(%rax)
            memset((void*) pa, 0xCC, PAGESIZE);
   40c07:	49 89 dc             	mov    %rbx,%r12
   40c0a:	ba 00 10 00 00       	mov    $0x1000,%edx
   40c0f:	be cc 00 00 00       	mov    $0xcc,%esi
   40c14:	48 89 df             	mov    %rbx,%rdi
   40c17:	e8 24 3c 00 00       	call   44840 <memset>
}
   40c1c:	4c 89 e0             	mov    %r12,%rax
   40c1f:	5b                   	pop    %rbx
   40c20:	41 5c                	pop    %r12
   40c22:	5d                   	pop    %rbp
   40c23:	c3                   	ret
    return nullptr;
   40c24:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   40c2a:	eb f0                	jmp    40c1c <kalloc(unsigned long)+0x63>
        return nullptr;
   40c2c:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   40c32:	eb e8                	jmp    40c1c <kalloc(unsigned long)+0x63>

0000000000040c34 <process_setup(int, char const*)>:
// Exercise 4: isolate address spaces
// - see instructions for the TODOs
// - most of your code will go to "process_setup"
// - there are several other places you need to touch.

void process_setup(pid_t pid, const char* program_name) {
   40c34:	55                   	push   %rbp
   40c35:	48 89 e5             	mov    %rsp,%rbp
   40c38:	41 57                	push   %r15
   40c3a:	41 56                	push   %r14
   40c3c:	41 55                	push   %r13
   40c3e:	41 54                	push   %r12
   40c40:	53                   	push   %rbx
   40c41:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
   40c48:	89 bd 4c ff ff ff    	mov    %edi,-0xb4(%rbp)
   40c4e:	48 89 b5 40 ff ff ff 	mov    %rsi,-0xc0(%rbp)
    init_process(&ptable[pid], 0);
   40c55:	4c 63 e7             	movslq %edi,%r12
   40c58:	4b 8d 1c 64          	lea    (%r12,%r12,2),%rbx
   40c5c:	48 c1 e3 02          	shl    $0x2,%rbx
   40c60:	4a 8d 3c 23          	lea    (%rbx,%r12,1),%rdi
   40c64:	48 c1 e7 04          	shl    $0x4,%rdi
   40c68:	48 81 c7 20 92 05 00 	add    $0x59220,%rdi
   40c6f:	be 00 00 00 00       	mov    $0x0,%esi
   40c74:	e8 3d 1a 00 00       	call   426b6 <init_process(proc*, int)>

    // initialize process page table
    //ptable[pid].pagetable = kernel_pagetable;

    ptable[pid].pagetable = (x86_64_pagetable*) kalloc(PAGESIZE);
   40c79:	bf 00 10 00 00       	mov    $0x1000,%edi
   40c7e:	e8 36 ff ff ff       	call   40bb9 <kalloc(unsigned long)>
   40c83:	4c 01 e3             	add    %r12,%rbx
   40c86:	48 c1 e3 04          	shl    $0x4,%rbx
   40c8a:	48 89 83 20 92 05 00 	mov    %rax,0x59220(%rbx)
    assert(ptable[pid].pagetable);
   40c91:	48 85 c0             	test   %rax,%rax
   40c94:	74 7d                	je     40d13 <process_setup(int, char const*)+0xdf>
   40c96:	48 89 c7             	mov    %rax,%rdi
    memset(ptable[pid].pagetable, 0, PAGESIZE);
   40c99:	ba 00 10 00 00       	mov    $0x1000,%edx
   40c9e:	be 00 00 00 00       	mov    $0x0,%esi
   40ca3:	e8 98 3b 00 00       	call   44840 <memset>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   40ca8:	48 c7 85 58 ff ff ff 	movq   $0x5b000,-0xa8(%rbp)
   40caf:	00 b0 05 00 
   40cb3:	48 c7 85 60 ff ff ff 	movq   $0x5b000,-0xa0(%rbp)
   40cba:	00 b0 05 00 
   40cbe:	c7 85 68 ff ff ff 03 	movl   $0x3,-0x98(%rbp)
   40cc5:	00 00 00 
   40cc8:	c7 85 6c ff ff ff ff 	movl   $0xfff,-0x94(%rbp)
   40ccf:	0f 00 00 
   40cd2:	48 c7 85 70 ff ff ff 	movq   $0x0,-0x90(%rbp)
   40cd9:	00 00 00 00 
    real_find(va);
   40cdd:	be 00 00 00 00       	mov    $0x0,%esi
   40ce2:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40ce9:	e8 7e 13 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   40cee:	48 8b b5 70 ff ff ff 	mov    -0x90(%rbp),%rsi

    for(vmiter it(kernel_pagetable, 0); it.va() < PROC_START_ADDR; it += PAGESIZE)
   40cf5:	48 81 fe ff ff 0f 00 	cmp    $0xfffff,%rsi
   40cfc:	0f 87 4d 01 00 00    	ja     40e4f <process_setup(int, char const*)+0x21b>
    {
        if (it.present())
        {
            int r = vmiter(ptable[pid].pagetable, it.va()).try_map(it.pa(), it.perm());
   40d02:	4c 63 a5 4c ff ff ff 	movslq -0xb4(%rbp),%r12
   40d09:	4b 8d 1c 64          	lea    (%r12,%r12,2),%rbx
   40d0d:	48 c1 e3 02          	shl    $0x2,%rbx
   40d11:	eb 76                	jmp    40d89 <process_setup(int, char const*)+0x155>
    assert(ptable[pid].pagetable);
   40d13:	b9 00 00 00 00       	mov    $0x0,%ecx
   40d18:	ba 92 55 04 00       	mov    $0x45592,%edx
   40d1d:	be da 00 00 00       	mov    $0xda,%esi
   40d22:	bf a8 55 04 00       	mov    $0x455a8,%edi
   40d27:	e8 f8 20 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
   40d2c:	8d 4c f6 0c          	lea    0xc(%rsi,%rsi,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   40d30:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
   40d37:	48 d3 e6             	shl    %cl,%rsi
   40d3a:	48 f7 d6             	not    %rsi
   40d3d:	48 23 b5 70 ff ff ff 	and    -0x90(%rbp),%rsi
   40d44:	48 01 c6             	add    %rax,%rsi
            int r = vmiter(ptable[pid].pagetable, it.va()).try_map(it.pa(), it.perm());
   40d47:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   40d4e:	e8 2f 15 00 00       	call   42282 <vmiter::try_map(unsigned long, int)>
            assert(r == 0);
   40d53:	85 c0                	test   %eax,%eax
   40d55:	0f 85 db 00 00 00    	jne    40e36 <process_setup(int, char const*)+0x202>
        real_find(va);
    }
    return *this;
}
inline vmiter& vmiter::operator+=(intptr_t delta) {
    return find(va_ + delta);
   40d5b:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
   40d62:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   40d69:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40d70:	e8 f7 12 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   40d75:	48 8b b5 70 ff ff ff 	mov    -0x90(%rbp),%rsi
    for(vmiter it(kernel_pagetable, 0); it.va() < PROC_START_ADDR; it += PAGESIZE)
   40d7c:	48 81 fe ff ff 0f 00 	cmp    $0xfffff,%rsi
   40d83:	0f 87 c6 00 00 00    	ja     40e4f <process_setup(int, char const*)+0x21b>
    uint64_t ph = *pep_ & perm_;
   40d89:	48 63 85 6c ff ff ff 	movslq -0x94(%rbp),%rax
   40d90:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
   40d97:	48 23 02             	and    (%rdx),%rax
        if (it.present())
   40d9a:	a8 01                	test   $0x1,%al
   40d9c:	74 bd                	je     40d5b <process_setup(int, char const*)+0x127>
            int r = vmiter(ptable[pid].pagetable, it.va()).try_map(it.pa(), it.perm());
   40d9e:	4a 8d 04 23          	lea    (%rbx,%r12,1),%rax
   40da2:	48 c1 e0 04          	shl    $0x4,%rax
   40da6:	48 8b 80 20 92 05 00 	mov    0x59220(%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   40dad:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   40db4:	48 89 45 80          	mov    %rax,-0x80(%rbp)
   40db8:	c7 45 88 03 00 00 00 	movl   $0x3,-0x78(%rbp)
   40dbf:	c7 45 8c ff 0f 00 00 	movl   $0xfff,-0x74(%rbp)
   40dc6:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
   40dcd:	00 
    real_find(va);
   40dce:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   40dd5:	e8 92 12 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    uint64_t ph = *pep_ & perm_;
   40dda:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
   40de1:	48 8b 08             	mov    (%rax),%rcx
   40de4:	48 63 85 6c ff ff ff 	movslq -0x94(%rbp),%rax
   40deb:	48 21 c8             	and    %rcx,%rax
    return ph & -(ph & PTE_P);
   40dee:	48 89 c2             	mov    %rax,%rdx
   40df1:	83 e2 01             	and    $0x1,%edx
   40df4:	48 f7 da             	neg    %rdx
   40df7:	21 c2                	and    %eax,%edx
        return -1;
   40df9:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
    if (*pep_ & PTE_P) {
   40e00:	f6 c1 01             	test   $0x1,%cl
   40e03:	0f 84 3e ff ff ff    	je     40d47 <process_setup(int, char const*)+0x113>
        if (level_ > 0) {
   40e09:	8b b5 68 ff ff ff    	mov    -0x98(%rbp),%esi
            pa &= ~0x1000UL;
   40e0f:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   40e16:	ff 0f 00 
   40e19:	48 21 c8             	and    %rcx,%rax
        if (level_ > 0) {
   40e1c:	85 f6                	test   %esi,%esi
   40e1e:	0f 8f 08 ff ff ff    	jg     40d2c <process_setup(int, char const*)+0xf8>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   40e24:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   40e2b:	ff 0f 00 
   40e2e:	48 21 c8             	and    %rcx,%rax
   40e31:	e9 f6 fe ff ff       	jmp    40d2c <process_setup(int, char const*)+0xf8>
            assert(r == 0);
   40e36:	b9 00 00 00 00       	mov    $0x0,%ecx
   40e3b:	ba b2 55 04 00       	mov    $0x455b2,%edx
   40e40:	be e2 00 00 00       	mov    $0xe2,%esi
   40e45:	bf a8 55 04 00       	mov    $0x455a8,%edi
   40e4a:	e8 d5 1f 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
        
    }

    // obtain reference to program image
    // (The program image models the process executable.)
    program_image pgm(program_name);
   40e4f:	48 8b b5 40 ff ff ff 	mov    -0xc0(%rbp),%rsi
   40e56:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40e5a:	e8 f5 2c 00 00       	call   43b54 <program_image::program_image(char const*)>

    // Allocate, map and copy

    for(auto seg = pgm.begin(); seg != pgm.end(); seg++)
   40e5f:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40e63:	e8 86 2d 00 00       	call   43bee <program_image::begin() const>
   40e68:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
   40e6f:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
            if(seg.writable())
            {
                perm = perm | PTE_W;
            }

            int r = vmiter(ptable[pid].pagetable, a).try_map(pa, perm);
   40e76:	4c 63 bd 4c ff ff ff 	movslq -0xb4(%rbp),%r15
   40e7d:	4f 8d 34 7f          	lea    (%r15,%r15,2),%r14
   40e81:	49 c1 e6 02          	shl    $0x2,%r14
    for(auto seg = pgm.begin(); seg != pgm.end(); seg++)
   40e85:	e9 c3 00 00 00       	jmp    40f4d <process_setup(int, char const*)+0x319>
            void *pa = kalloc(PAGESIZE);
   40e8a:	bf 00 10 00 00       	mov    $0x1000,%edi
   40e8f:	e8 25 fd ff ff       	call   40bb9 <kalloc(unsigned long)>
   40e94:	49 89 c4             	mov    %rax,%r12
            assert(pa);
   40e97:	48 85 c0             	test   %rax,%rax
   40e9a:	0f 84 e9 00 00 00    	je     40f89 <process_setup(int, char const*)+0x355>
            if(seg.writable())
   40ea0:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40ea7:	e8 ee 2d 00 00       	call   43c9a <program_image_segment::writable() const>
            int perm = PTE_P | PTE_U;
   40eac:	3c 01                	cmp    $0x1,%al
   40eae:	19 db                	sbb    %ebx,%ebx
   40eb0:	83 e3 fe             	and    $0xfffffffe,%ebx
   40eb3:	83 c3 07             	add    $0x7,%ebx
            int r = vmiter(ptable[pid].pagetable, a).try_map(pa, perm);
   40eb6:	4b 8d 04 3e          	lea    (%r14,%r15,1),%rax
   40eba:	48 c1 e0 04          	shl    $0x4,%rax
   40ebe:	48 8b 80 20 92 05 00 	mov    0x59220(%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   40ec5:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   40ecc:	48 89 45 80          	mov    %rax,-0x80(%rbp)
   40ed0:	c7 45 88 03 00 00 00 	movl   $0x3,-0x78(%rbp)
   40ed7:	c7 45 8c ff 0f 00 00 	movl   $0xfff,-0x74(%rbp)
   40ede:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
   40ee5:	00 
    real_find(va);
   40ee6:	4c 89 ee             	mov    %r13,%rsi
   40ee9:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   40ef0:	e8 77 11 00 00       	call   4206c <vmiter::real_find(unsigned long)>
}
inline void vmiter::map(void* kp, int perm) {
    map((uintptr_t) kp, perm);
}
inline int vmiter::try_map(void* kp, int perm) {
    return try_map((uintptr_t) kp, perm);
   40ef5:	89 da                	mov    %ebx,%edx
   40ef7:	4c 89 e6             	mov    %r12,%rsi
   40efa:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   40f01:	e8 7c 13 00 00       	call   42282 <vmiter::try_map(unsigned long, int)>
            assert(r == 0);
   40f06:	85 c0                	test   %eax,%eax
   40f08:	0f 85 94 00 00 00    	jne    40fa2 <process_setup(int, char const*)+0x36e>
        a < seg.va() + seg.size(); a += PAGESIZE)
   40f0e:	49 81 c5 00 10 00 00 	add    $0x1000,%r13
   40f15:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40f1c:	e8 45 2d 00 00       	call   43c66 <program_image_segment::va() const>
   40f21:	48 89 c3             	mov    %rax,%rbx
   40f24:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40f2b:	e8 42 2d 00 00       	call   43c72 <program_image_segment::size() const>
   40f30:	48 01 c3             	add    %rax,%rbx
   40f33:	49 39 dd             	cmp    %rbx,%r13
   40f36:	0f 82 4e ff ff ff    	jb     40e8a <process_setup(int, char const*)+0x256>
    for(auto seg = pgm.begin(); seg != pgm.end(); seg++)
   40f3c:	be 00 00 00 00       	mov    $0x0,%esi
   40f41:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40f48:	e8 fd 2d 00 00       	call   43d4a <program_image_segment::operator++(int)>
   40f4d:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40f51:	e8 cc 2c 00 00       	call   43c22 <program_image::end() const>
   40f56:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   40f5a:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
   40f5e:	48 8d 75 a0          	lea    -0x60(%rbp),%rsi
   40f62:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40f69:	e8 3c 2d 00 00       	call   43caa <program_image_segment::operator!=(program_image_segment const&) const>
   40f6e:	84 c0                	test   %al,%al
   40f70:	74 49                	je     40fbb <process_setup(int, char const*)+0x387>
        for(uintptr_t a = round_down(seg.va(), PAGESIZE); 
   40f72:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   40f79:	e8 e8 2c 00 00       	call   43c66 <program_image_segment::va() const>
   40f7e:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40f84:	49 89 c5             	mov    %rax,%r13
   40f87:	eb 8c                	jmp    40f15 <process_setup(int, char const*)+0x2e1>
            assert(pa);
   40f89:	b9 00 00 00 00       	mov    $0x0,%ecx
   40f8e:	ba b8 56 04 00       	mov    $0x456b8,%edx
   40f93:	be f3 00 00 00       	mov    $0xf3,%esi
   40f98:	bf a8 55 04 00       	mov    $0x455a8,%edi
   40f9d:	e8 82 1e 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
            assert(r == 0);
   40fa2:	b9 00 00 00 00       	mov    $0x0,%ecx
   40fa7:	ba b2 55 04 00       	mov    $0x455b2,%edx
   40fac:	be fb 00 00 00       	mov    $0xfb,%esi
   40fb1:	bf a8 55 04 00       	mov    $0x455a8,%edi
   40fb6:	e8 69 1e 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
        }
    }

    for(auto seg = pgm.begin(); seg != pgm.end(); seg++)
   40fbb:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40fbf:	e8 2a 2c 00 00       	call   43bee <program_image::begin() const>
   40fc4:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
   40fcb:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
    {
        uintptr_t va = seg.va();
        uintptr_t pa = vmiter(ptable[pid].pagetable, va).pa();
   40fd2:	4c 63 b5 4c ff ff ff 	movslq -0xb4(%rbp),%r14
   40fd9:	4f 8d 2c 76          	lea    (%r14,%r14,2),%r13
   40fdd:	49 c1 e5 02          	shl    $0x2,%r13
    for(auto seg = pgm.begin(); seg != pgm.end(); seg++)
   40fe1:	eb 6e                	jmp    41051 <process_setup(int, char const*)+0x41d>
   40fe3:	8d 4c d2 0c          	lea    0xc(%rdx,%rdx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   40fe7:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
   40fee:	48 d3 e3             	shl    %cl,%rbx
   40ff1:	48 f7 d3             	not    %rbx
   40ff4:	48 23 5d 90          	and    -0x70(%rbp),%rbx
   40ff8:	48 01 c3             	add    %rax,%rbx

        memset((void *) pa, 0, seg.size());
   40ffb:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   41002:	e8 6b 2c 00 00       	call   43c72 <program_image_segment::size() const>
   41007:	48 89 c2             	mov    %rax,%rdx
   4100a:	be 00 00 00 00       	mov    $0x0,%esi
   4100f:	48 89 df             	mov    %rbx,%rdi
   41012:	e8 29 38 00 00       	call   44840 <memset>
        memcpy((void *) pa, seg.data(), seg.data_size());
   41017:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   4101e:	e8 6b 2c 00 00       	call   43c8e <program_image_segment::data_size() const>
   41023:	49 89 c4             	mov    %rax,%r12
   41026:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   4102d:	e8 4c 2c 00 00       	call   43c7e <program_image_segment::data() const>
   41032:	48 89 c6             	mov    %rax,%rsi
   41035:	4c 89 e2             	mov    %r12,%rdx
   41038:	48 89 df             	mov    %rbx,%rdi
   4103b:	e8 dc 37 00 00       	call   4481c <memcpy>
    for(auto seg = pgm.begin(); seg != pgm.end(); seg++)
   41040:	be 00 00 00 00       	mov    $0x0,%esi
   41045:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   4104c:	e8 f9 2c 00 00       	call   43d4a <program_image_segment::operator++(int)>
   41051:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   41055:	e8 c8 2b 00 00       	call   43c22 <program_image::end() const>
   4105a:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   4105e:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   41062:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
   41066:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   4106d:	e8 38 2c 00 00       	call   43caa <program_image_segment::operator!=(program_image_segment const&) const>
   41072:	84 c0                	test   %al,%al
   41074:	0f 84 8d 00 00 00    	je     41107 <process_setup(int, char const*)+0x4d3>
        uintptr_t va = seg.va();
   4107a:	48 8d bd 58 ff ff ff 	lea    -0xa8(%rbp),%rdi
   41081:	e8 e0 2b 00 00       	call   43c66 <program_image_segment::va() const>
   41086:	48 89 c6             	mov    %rax,%rsi
        uintptr_t pa = vmiter(ptable[pid].pagetable, va).pa();
   41089:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
   4108e:	48 c1 e0 04          	shl    $0x4,%rax
   41092:	48 8b 80 20 92 05 00 	mov    0x59220(%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   41099:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   410a0:	48 89 45 80          	mov    %rax,-0x80(%rbp)
   410a4:	c7 45 88 03 00 00 00 	movl   $0x3,-0x78(%rbp)
   410ab:	c7 45 8c ff 0f 00 00 	movl   $0xfff,-0x74(%rbp)
   410b2:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
   410b9:	00 
    real_find(va);
   410ba:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   410c1:	e8 a6 0f 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   410c6:	48 8b 45 80          	mov    -0x80(%rbp),%rax
   410ca:	48 8b 08             	mov    (%rax),%rcx
        return -1;
   410cd:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
    if (*pep_ & PTE_P) {
   410d4:	f6 c1 01             	test   $0x1,%cl
   410d7:	0f 84 1e ff ff ff    	je     40ffb <process_setup(int, char const*)+0x3c7>
        if (level_ > 0) {
   410dd:	8b 55 88             	mov    -0x78(%rbp),%edx
            pa &= ~0x1000UL;
   410e0:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   410e7:	ff 0f 00 
   410ea:	48 21 c8             	and    %rcx,%rax
        if (level_ > 0) {
   410ed:	85 d2                	test   %edx,%edx
   410ef:	0f 8f ee fe ff ff    	jg     40fe3 <process_setup(int, char const*)+0x3af>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   410f5:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   410fc:	ff 0f 00 
   410ff:	48 21 c8             	and    %rcx,%rax
   41102:	e9 dc fe ff ff       	jmp    40fe3 <process_setup(int, char const*)+0x3af>
    // - copy-paste the code from Exercise 3 instructions
    // - complete it and check if the outputs align with "objdump"
    // TODO: your code here


    log_printf("program %s: entry point %p\n", program_name, pgm.entry());
   41107:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   4110b:	e8 6c 2a 00 00       	call   43b7c <program_image::entry() const>
   41110:	48 89 c2             	mov    %rax,%rdx
   41113:	48 8b b5 40 ff ff ff 	mov    -0xc0(%rbp),%rsi
   4111a:	bf b9 55 04 00       	mov    $0x455b9,%edi
   4111f:	b8 00 00 00 00       	mov    $0x0,%eax
   41124:	e8 c3 17 00 00       	call   428ec <log_printf(char const*, ...)>
    size_t n = 0;
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg, ++n) {
   41129:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   4112d:	e8 bc 2a 00 00       	call   43bee <program_image::begin() const>
   41132:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   41139:	48 89 55 80          	mov    %rdx,-0x80(%rbp)
    size_t n = 0;
   4113d:	41 be 00 00 00 00    	mov    $0x0,%r14d
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg, ++n) {
   41143:	eb 75                	jmp    411ba <process_setup(int, char const*)+0x586>
    log_printf("  seg[%zu]: addr %p, size %p, data_size %p, read-only? (%s)\n",
               n, seg.va(),
               seg.size(),
               seg.data_size(),
               seg.writable()? "no" :"yes"); 
   41145:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   4114c:	e8 49 2b 00 00       	call   43c9a <program_image_segment::writable() const>
    log_printf("  seg[%zu]: addr %p, size %p, data_size %p, read-only? (%s)\n",
   41151:	84 c0                	test   %al,%al
   41153:	41 bd 8e 55 04 00    	mov    $0x4558e,%r13d
   41159:	b8 8b 55 04 00       	mov    $0x4558b,%eax
   4115e:	4c 0f 45 e8          	cmovne %rax,%r13
   41162:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   41169:	e8 20 2b 00 00       	call   43c8e <program_image_segment::data_size() const>
   4116e:	49 89 c4             	mov    %rax,%r12
   41171:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   41178:	e8 f5 2a 00 00       	call   43c72 <program_image_segment::size() const>
   4117d:	48 89 c3             	mov    %rax,%rbx
   41180:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   41187:	e8 da 2a 00 00       	call   43c66 <program_image_segment::va() const>
   4118c:	48 89 c2             	mov    %rax,%rdx
   4118f:	4d 89 e9             	mov    %r13,%r9
   41192:	4d 89 e0             	mov    %r12,%r8
   41195:	48 89 d9             	mov    %rbx,%rcx
   41198:	4c 89 f6             	mov    %r14,%rsi
   4119b:	bf 60 59 04 00       	mov    $0x45960,%edi
   411a0:	b8 00 00 00 00       	mov    $0x0,%eax
   411a5:	e8 42 17 00 00       	call   428ec <log_printf(char const*, ...)>
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg, ++n) {
   411aa:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   411b1:	e8 02 2b 00 00       	call   43cb8 <program_image_segment::operator++()>
   411b6:	49 83 c6 01          	add    $0x1,%r14
   411ba:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   411be:	e8 5f 2a 00 00       	call   43c22 <program_image::end() const>
   411c3:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   411c7:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   411cb:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
   411cf:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   411d6:	e8 cf 2a 00 00       	call   43caa <program_image_segment::operator!=(program_image_segment const&) const>
   411db:	84 c0                	test   %al,%al
   411dd:	0f 85 62 ff ff ff    	jne    41145 <process_setup(int, char const*)+0x511>
        memcpy((void*) seg.va(), seg.data(), seg.data_size());
    }
    */

    // mark entry point
    ptable[pid].regs.reg_rip = pgm.entry();
   411e3:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   411e7:	e8 90 29 00 00       	call   43b7c <program_image::entry() const>
   411ec:	48 89 c2             	mov    %rax,%rdx
   411ef:	48 63 85 4c ff ff ff 	movslq -0xb4(%rbp),%rax
   411f6:	48 8d 0c 40          	lea    (%rax,%rax,2),%rcx
   411fa:	48 8d 04 88          	lea    (%rax,%rcx,4),%rax
   411fe:	48 c1 e0 04          	shl    $0x4,%rax
   41202:	48 89 90 c8 92 05 00 	mov    %rdx,0x592c8(%rax)
    uintptr_t stack_addr = MEMSIZE_VIRTUAL - PAGESIZE;

    // The handout code requires that the corresponding physical address
    // is currently free.

    void * stack_pa = kalloc(PAGESIZE);
   41209:	bf 00 10 00 00       	mov    $0x1000,%edi
   4120e:	e8 a6 f9 ff ff       	call   40bb9 <kalloc(unsigned long)>
   41213:	48 89 c3             	mov    %rax,%rbx
    assert(stack_pa);
   41216:	48 85 c0             	test   %rax,%rax
   41219:	0f 84 b4 00 00 00    	je     412d3 <process_setup(int, char const*)+0x69f>
    memset(stack_pa, 0, PAGESIZE);
   4121f:	ba 00 10 00 00       	mov    $0x1000,%edx
   41224:	be 00 00 00 00       	mov    $0x0,%esi
   41229:	48 89 c7             	mov    %rax,%rdi
   4122c:	e8 0f 36 00 00       	call   44840 <memset>
    int r = vmiter(ptable[pid].pagetable, stack_addr).try_map(stack_pa, 
   41231:	48 63 85 4c ff ff ff 	movslq -0xb4(%rbp),%rax
   41238:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   4123c:	48 8d 04 90          	lea    (%rax,%rdx,4),%rax
   41240:	48 c1 e0 04          	shl    $0x4,%rax
   41244:	48 8b 80 20 92 05 00 	mov    0x59220(%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4124b:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   41252:	48 89 45 80          	mov    %rax,-0x80(%rbp)
   41256:	c7 45 88 03 00 00 00 	movl   $0x3,-0x78(%rbp)
   4125d:	c7 45 8c ff 0f 00 00 	movl   $0xfff,-0x74(%rbp)
   41264:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
   4126b:	00 
    real_find(va);
   4126c:	be 00 f0 2f 00       	mov    $0x2ff000,%esi
   41271:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   41278:	e8 ef 0d 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    return try_map((uintptr_t) kp, perm);
   4127d:	ba 07 00 00 00       	mov    $0x7,%edx
   41282:	48 89 de             	mov    %rbx,%rsi
   41285:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   4128c:	e8 f1 0f 00 00       	call   42282 <vmiter::try_map(unsigned long, int)>
        PTE_P | PTE_W | PTE_U);
    assert(r==0);
   41291:	85 c0                	test   %eax,%eax
   41293:	75 57                	jne    412ec <process_setup(int, char const*)+0x6b8>
    //assert(physpages[stack_addr / PAGESIZE].refcount == 0);
    //++physpages[stack_addr / PAGESIZE].refcount;
    ptable[pid].regs.reg_rsp = stack_addr + PAGESIZE;
   41295:	48 63 85 4c ff ff ff 	movslq -0xb4(%rbp),%rax
   4129c:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   412a0:	48 c1 e2 02          	shl    $0x2,%rdx
   412a4:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
   412a8:	48 c1 e1 04          	shl    $0x4,%rcx
   412ac:	48 c7 81 e0 92 05 00 	movq   $0x300000,0x592e0(%rcx)
   412b3:	00 00 30 00 

    // mark process as runnable
    ptable[pid].state = P_RUNNABLE;
   412b7:	c7 81 2c 92 05 00 01 	movl   $0x1,0x5922c(%rcx)
   412be:	00 00 00 
}
   412c1:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   412c8:	5b                   	pop    %rbx
   412c9:	41 5c                	pop    %r12
   412cb:	41 5d                	pop    %r13
   412cd:	41 5e                	pop    %r14
   412cf:	41 5f                	pop    %r15
   412d1:	5d                   	pop    %rbp
   412d2:	c3                   	ret
    assert(stack_pa);
   412d3:	b9 00 00 00 00       	mov    $0x0,%ecx
   412d8:	ba d5 55 04 00       	mov    $0x455d5,%edx
   412dd:	be 3e 01 00 00       	mov    $0x13e,%esi
   412e2:	bf a8 55 04 00       	mov    $0x455a8,%edi
   412e7:	e8 38 1b 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
    assert(r==0);
   412ec:	b9 00 00 00 00       	mov    $0x0,%ecx
   412f1:	ba de 55 04 00       	mov    $0x455de,%edx
   412f6:	be 42 01 00 00       	mov    $0x142,%esi
   412fb:	bf a8 55 04 00       	mov    $0x455a8,%edi
   41300:	e8 1f 1b 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>

0000000000041305 <kfree(void*)>:
void kfree(void* kptr) {
   41305:	f3 0f 1e fa          	endbr64
    if (!kptr)
   41309:	48 85 ff             	test   %rdi,%rdi
   4130c:	74 18                	je     41326 <kfree(void*)+0x21>
    assert(physpages[pa / PAGESIZE].refcount > 0);
   4130e:	48 c1 ef 0c          	shr    $0xc,%rdi
   41312:	0f b6 87 00 90 05 00 	movzbl 0x59000(%rdi),%eax
   41319:	84 c0                	test   %al,%al
   4131b:	74 0a                	je     41327 <kfree(void*)+0x22>
    physpages[pa / PAGESIZE].refcount--;
   4131d:	83 e8 01             	sub    $0x1,%eax
   41320:	88 87 00 90 05 00    	mov    %al,0x59000(%rdi)
   41326:	c3                   	ret
void kfree(void* kptr) {
   41327:	55                   	push   %rbp
   41328:	48 89 e5             	mov    %rsp,%rbp
    assert(physpages[pa / PAGESIZE].refcount > 0);
   4132b:	b9 00 00 00 00       	mov    $0x0,%ecx
   41330:	ba a8 59 04 00       	mov    $0x459a8,%edx
   41335:	be c3 00 00 00       	mov    $0xc3,%esi
   4133a:	bf a8 55 04 00       	mov    $0x455a8,%edi
   4133f:	e8 e0 1a 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>

0000000000041344 <syscall_page_alloc(unsigned long)>:
// syscall_page_alloc(addr)
//    Handles the SYSCALL_PAGE_ALLOC system call. This function
//    should implement the specification for `sys_page_alloc`
//    in `u-lib.hh` (but in the handout code, it does not).

int syscall_page_alloc(uintptr_t addr) {
   41344:	f3 0f 1e fa          	endbr64

    if(addr % PAGESIZE != 0
   41348:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
   4134e:	0f 85 aa 00 00 00    	jne    413fe <syscall_page_alloc(unsigned long)+0xba>
int syscall_page_alloc(uintptr_t addr) {
   41354:	55                   	push   %rbp
   41355:	48 89 e5             	mov    %rsp,%rbp
   41358:	41 54                	push   %r12
   4135a:	53                   	push   %rbx
   4135b:	48 83 ec 20          	sub    $0x20,%rsp
   4135f:	48 89 fb             	mov    %rdi,%rbx
    || addr < PROC_START_ADDR
    || addr >= MEMSIZE_VIRTUAL)
   41362:	48 8d 87 00 00 f0 ff 	lea    -0x100000(%rdi),%rax
   41369:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   4136f:	0f 87 8f 00 00 00    	ja     41404 <syscall_page_alloc(unsigned long)+0xc0>
    {
        return -1;
    }

    void * pa = kalloc(PAGESIZE);
   41375:	bf 00 10 00 00       	mov    $0x1000,%edi
   4137a:	e8 3a f8 ff ff       	call   40bb9 <kalloc(unsigned long)>
   4137f:	49 89 c4             	mov    %rax,%r12
    if(!pa){
   41382:	48 85 c0             	test   %rax,%rax
   41385:	0f 84 80 00 00 00    	je     4140b <syscall_page_alloc(unsigned long)+0xc7>
        return -1;
    }

    memset(pa, 0, PAGESIZE);
   4138b:	ba 00 10 00 00       	mov    $0x1000,%edx
   41390:	be 00 00 00 00       	mov    $0x0,%esi
   41395:	48 89 c7             	mov    %rax,%rdi
   41398:	e8 a3 34 00 00       	call   44840 <memset>
    int r = vmiter(current->pagetable, addr).try_map(pa, PTE_P | PTE_W | PTE_U);
   4139d:	48 8b 05 5c 7e 01 00 	mov    0x17e5c(%rip),%rax        # 59200 <current>
   413a4:	48 8b 00             	mov    (%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   413a7:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
   413ab:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
   413af:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   413b6:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   413bd:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   413c4:	00 
    real_find(va);
   413c5:	48 89 de             	mov    %rbx,%rsi
   413c8:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   413cc:	e8 9b 0c 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    return try_map((uintptr_t) kp, perm);
   413d1:	ba 07 00 00 00       	mov    $0x7,%edx
   413d6:	4c 89 e6             	mov    %r12,%rsi
   413d9:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   413dd:	e8 a0 0e 00 00       	call   42282 <vmiter::try_map(unsigned long, int)>
    if(r!=0)
   413e2:	85 c0                	test   %eax,%eax
   413e4:	75 09                	jne    413ef <syscall_page_alloc(unsigned long)+0xab>

    //assert(physpages[addr / PAGESIZE].refcount == 0);
    //++physpages[addr / PAGESIZE].refcount;
    //memset((void*) addr, 0, PAGESIZE);
    //return 0;
}
   413e6:	48 83 c4 20          	add    $0x20,%rsp
   413ea:	5b                   	pop    %rbx
   413eb:	41 5c                	pop    %r12
   413ed:	5d                   	pop    %rbp
   413ee:	c3                   	ret
        kfree(pa); return -1;
   413ef:	4c 89 e7             	mov    %r12,%rdi
   413f2:	e8 0e ff ff ff       	call   41305 <kfree(void*)>
   413f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   413fc:	eb e8                	jmp    413e6 <syscall_page_alloc(unsigned long)+0xa2>
        return -1;
   413fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   41403:	c3                   	ret
        return -1;
   41404:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   41409:	eb db                	jmp    413e6 <syscall_page_alloc(unsigned long)+0xa2>
        return -1;
   4140b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   41410:	eb d4                	jmp    413e6 <syscall_page_alloc(unsigned long)+0xa2>

0000000000041412 <run(proc*)>:

// run(p)
//    Run process `p`. This involves setting `current = p` and calling
//    `exception_return` to restore its page table and registers.

void run(proc* p) {
   41412:	f3 0f 1e fa          	endbr64
   41416:	55                   	push   %rbp
   41417:	48 89 e5             	mov    %rsp,%rbp
   4141a:	53                   	push   %rbx
   4141b:	48 83 ec 08          	sub    $0x8,%rsp
    assert(p->state == P_RUNNABLE);
   4141f:	83 7f 0c 01          	cmpl   $0x1,0xc(%rdi)
   41423:	75 1a                	jne    4143f <run(proc*)+0x2d>
   41425:	48 89 fb             	mov    %rdi,%rbx
    current = p;
   41428:	48 89 3d d1 7d 01 00 	mov    %rdi,0x17dd1(%rip)        # 59200 <current>

    // Check the process's current pagetable.
    check_pagetable(p->pagetable);
   4142f:	48 8b 3f             	mov    (%rdi),%rdi
   41432:	e8 38 1f 00 00       	call   4336f <check_pagetable(x86_64_pagetable*)>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(p);
   41437:	48 89 df             	mov    %rbx,%rdi
   4143a:	e8 60 f6 ff ff       	call   40a9f <exception_return(proc*)>
    assert(p->state == P_RUNNABLE);
   4143f:	b9 00 00 00 00       	mov    $0x0,%ecx
   41444:	ba e3 55 04 00       	mov    $0x455e3,%edx
   41449:	be 6a 02 00 00       	mov    $0x26a,%esi
   4144e:	bf a8 55 04 00       	mov    $0x455a8,%edi
   41453:	e8 cc 19 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>

0000000000041458 <kernel_start(char const*)>:
void kernel_start(const char* command) {
   41458:	f3 0f 1e fa          	endbr64
   4145c:	55                   	push   %rbp
   4145d:	48 89 e5             	mov    %rsp,%rbp
   41460:	41 55                	push   %r13
   41462:	41 54                	push   %r12
   41464:	53                   	push   %rbx
   41465:	48 83 ec 38          	sub    $0x38,%rsp
   41469:	49 89 fd             	mov    %rdi,%r13
    init_hardware();
   4146c:	e8 3a 1a 00 00       	call   42eab <init_hardware()>
    log_printf("Starting WeensyOS\n");
   41471:	bf ff 55 04 00       	mov    $0x455ff,%edi
   41476:	b8 00 00 00 00       	mov    $0x0,%eax
   4147b:	e8 6c 14 00 00       	call   428ec <log_printf(char const*, ...)>
	bool is_lock_free() const noexcept					{ return __atomic_is_lock_free(sizeof(T), reinterpret_cast<void*>(-_alignment)); }
	bool is_lock_free() const volatile noexcept			{ return __atomic_is_lock_free(sizeof(T), reinterpret_cast<void*>(-_alignment)); }

	__always_inline T load(memory_order m = memory_order::seq_cst) const noexcept { return __atomic_load_n(&_value, int(m)); }
	__always_inline T load(memory_order m = memory_order::seq_cst) const volatile noexcept { return __atomic_load_n(&_value, int(m)); }
	__always_inline void store(T i, memory_order m = memory_order::seq_cst) noexcept { __atomic_store_n(&_value, i, int(m)); }
   41480:	b8 01 00 00 00       	mov    $0x1,%eax
   41485:	48 87 05 9c 8a 01 00 	xchg   %rax,0x18a9c(%rip)        # 59f28 <ticks>
    init_timer(HZ);
   4148c:	bf 64 00 00 00       	mov    $0x64,%edi
   41491:	e8 7b 11 00 00       	call   42611 <init_timer(int)>
    console_clear();
   41496:	e8 a8 3d 00 00       	call   45243 <console_clear()>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4149b:	48 c7 45 b8 00 b0 05 	movq   $0x5b000,-0x48(%rbp)
   414a2:	00 
   414a3:	48 c7 45 c0 00 b0 05 	movq   $0x5b000,-0x40(%rbp)
   414aa:	00 
   414ab:	c7 45 c8 03 00 00 00 	movl   $0x3,-0x38(%rbp)
   414b2:	c7 45 cc ff 0f 00 00 	movl   $0xfff,-0x34(%rbp)
   414b9:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
   414c0:	00 
    real_find(va);
   414c1:	be 00 10 00 00       	mov    $0x1000,%esi
   414c6:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   414ca:	e8 9d 0b 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    log_printf("[kernel] VA[0x1000] maps to PA[%p]\n", vmiter(kernel_pagetable, 0x1000).pa());
   414cf:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   414d3:	e8 8e f6 ff ff       	call   40b66 <vmiter::pa() const>
   414d8:	48 89 c6             	mov    %rax,%rsi
   414db:	bf d0 59 04 00       	mov    $0x459d0,%edi
   414e0:	b8 00 00 00 00       	mov    $0x0,%eax
   414e5:	e8 02 14 00 00       	call   428ec <log_printf(char const*, ...)>
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   414ea:	bb 00 00 00 00       	mov    $0x0,%ebx
   414ef:	e9 b0 00 00 00       	jmp    415a4 <kernel_start(char const*)+0x14c>
        assert(r == 0); // mappings during kernel_start MUST NOT fail
   414f4:	b9 00 00 00 00       	mov    $0x0,%ecx
   414f9:	ba b2 55 04 00       	mov    $0x455b2,%edx
   414fe:	be 79 00 00 00       	mov    $0x79,%esi
   41503:	bf a8 55 04 00       	mov    $0x455a8,%edi
   41508:	e8 17 19 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
        process_setup(1, "allocator");
   4150d:	be 12 56 04 00       	mov    $0x45612,%esi
   41512:	bf 01 00 00 00       	mov    $0x1,%edi
   41517:	e8 18 f7 ff ff       	call   40c34 <process_setup(int, char const*)>
        process_setup(2, "allocator2");
   4151c:	be 1c 56 04 00       	mov    $0x4561c,%esi
   41521:	bf 02 00 00 00       	mov    $0x2,%edi
   41526:	e8 09 f7 ff ff       	call   40c34 <process_setup(int, char const*)>
        process_setup(3, "allocator3");
   4152b:	be 27 56 04 00       	mov    $0x45627,%esi
   41530:	bf 03 00 00 00       	mov    $0x3,%edi
   41535:	e8 fa f6 ff ff       	call   40c34 <process_setup(int, char const*)>
        process_setup(4, "allocator4");
   4153a:	be 32 56 04 00       	mov    $0x45632,%esi
   4153f:	bf 04 00 00 00       	mov    $0x4,%edi
   41544:	e8 eb f6 ff ff       	call   40c34 <process_setup(int, char const*)>
   41549:	e9 21 01 00 00       	jmp    4166f <kernel_start(char const*)+0x217>
            perm = 0;
   4154e:	41 bc 00 00 00 00    	mov    $0x0,%r12d
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   41554:	48 c7 45 b8 00 b0 05 	movq   $0x5b000,-0x48(%rbp)
   4155b:	00 
   4155c:	48 c7 45 c0 00 b0 05 	movq   $0x5b000,-0x40(%rbp)
   41563:	00 
   41564:	c7 45 c8 03 00 00 00 	movl   $0x3,-0x38(%rbp)
   4156b:	c7 45 cc ff 0f 00 00 	movl   $0xfff,-0x34(%rbp)
   41572:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
   41579:	00 
    real_find(va);
   4157a:	48 89 de             	mov    %rbx,%rsi
   4157d:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   41581:	e8 e6 0a 00 00       	call   4206c <vmiter::real_find(unsigned long)>
        int r = vmiter(kernel_pagetable, addr).try_map(addr, perm);
   41586:	44 89 e2             	mov    %r12d,%edx
   41589:	48 89 de             	mov    %rbx,%rsi
   4158c:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   41590:	e8 ed 0c 00 00       	call   42282 <vmiter::try_map(unsigned long, int)>
        assert(r == 0); // mappings during kernel_start MUST NOT fail
   41595:	85 c0                	test   %eax,%eax
   41597:	0f 85 57 ff ff ff    	jne    414f4 <kernel_start(char const*)+0x9c>
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   4159d:	48 81 c3 00 10 00 00 	add    $0x1000,%rbx
        if (addr == 0) {
   415a4:	48 85 db             	test   %rbx,%rbx
   415a7:	74 a5                	je     4154e <kernel_start(char const*)+0xf6>
        }else if (addr < PROC_START_ADDR)
   415a9:	48 81 fb ff ff 0f 00 	cmp    $0xfffff,%rbx
   415b0:	77 0f                	ja     415c1 <kernel_start(char const*)+0x169>
            perm = PTE_P | PTE_W;
   415b2:	41 bc 03 00 00 00    	mov    $0x3,%r12d
        }else if (addr < PROC_START_ADDR)
   415b8:	48 81 fb 00 80 0b 00 	cmp    $0xb8000,%rbx
   415bf:	75 93                	jne    41554 <kernel_start(char const*)+0xfc>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   415c1:	48 c7 45 b8 00 b0 05 	movq   $0x5b000,-0x48(%rbp)
   415c8:	00 
   415c9:	48 c7 45 c0 00 b0 05 	movq   $0x5b000,-0x40(%rbp)
   415d0:	00 
   415d1:	c7 45 c8 03 00 00 00 	movl   $0x3,-0x38(%rbp)
   415d8:	c7 45 cc ff 0f 00 00 	movl   $0xfff,-0x34(%rbp)
   415df:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
   415e6:	00 
    real_find(va);
   415e7:	48 89 de             	mov    %rbx,%rsi
   415ea:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   415ee:	e8 79 0a 00 00       	call   4206c <vmiter::real_find(unsigned long)>
        int r = vmiter(kernel_pagetable, addr).try_map(addr, perm);
   415f3:	ba 07 00 00 00       	mov    $0x7,%edx
   415f8:	48 89 de             	mov    %rbx,%rsi
   415fb:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   415ff:	e8 7e 0c 00 00       	call   42282 <vmiter::try_map(unsigned long, int)>
        assert(r == 0); // mappings during kernel_start MUST NOT fail
   41604:	85 c0                	test   %eax,%eax
   41606:	0f 85 e8 fe ff ff    	jne    414f4 <kernel_start(char const*)+0x9c>
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   4160c:	48 81 c3 00 10 00 00 	add    $0x1000,%rbx
   41613:	48 81 fb 00 00 20 00 	cmp    $0x200000,%rbx
   4161a:	75 88                	jne    415a4 <kernel_start(char const*)+0x14c>
   4161c:	ba 28 92 05 00       	mov    $0x59228,%edx
        ptable[i].pid = i;
   41621:	89 02                	mov    %eax,(%rdx)
        ptable[i].state = P_FREE;
   41623:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%rdx)
    for (pid_t i = 0; i < NPROC; i++) {
   4162a:	83 c0 01             	add    $0x1,%eax
   4162d:	48 81 c2 d0 00 00 00 	add    $0xd0,%rdx
   41634:	83 f8 10             	cmp    $0x10,%eax
   41637:	75 e8                	jne    41621 <kernel_start(char const*)+0x1c9>
        command = WEENSYOS_FIRST_PROCESS;
   41639:	4d 85 ed             	test   %r13,%r13
   4163c:	b8 fa 55 04 00       	mov    $0x455fa,%eax
   41641:	4c 0f 44 e8          	cmove  %rax,%r13
    if (!program_image(command).empty()) {
   41645:	4c 89 ee             	mov    %r13,%rsi
   41648:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   4164c:	e8 03 25 00 00       	call   43b54 <program_image::program_image(char const*)>
   41651:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   41655:	e8 38 25 00 00       	call   43b92 <program_image::empty() const>
   4165a:	84 c0                	test   %al,%al
   4165c:	0f 85 ab fe ff ff    	jne    4150d <kernel_start(char const*)+0xb5>
        process_setup(1, command);
   41662:	4c 89 ee             	mov    %r13,%rsi
   41665:	bf 01 00 00 00       	mov    $0x1,%edi
   4166a:	e8 c5 f5 ff ff       	call   40c34 <process_setup(int, char const*)>
    run(&ptable[1]);
   4166f:	bf f0 92 05 00       	mov    $0x592f0,%edi
   41674:	e8 99 fd ff ff       	call   41412 <run(proc*)>

0000000000041679 <memshow()>:
// memshow()
//    Draw a picture of memory (physical and virtual) on the CGA console.
//    Switches to a new process's virtual memory map every 0.25 sec.
//    Uses `console_memviewer()`, a function defined in `k-memviewer.cc`.

void memshow() {
   41679:	f3 0f 1e fa          	endbr64
   4167d:	55                   	push   %rbp
   4167e:	48 89 e5             	mov    %rsp,%rbp
    static unsigned last_ticks = 0;
    static int showing = 0;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
   41681:	83 3d 9c 88 01 00 00 	cmpl   $0x0,0x1889c(%rip)        # 59f24 <memshow()::last_ticks>
   41688:	74 16                	je     416a0 <memshow()+0x27>
	__always_inline T load(memory_order m = memory_order::seq_cst) const noexcept { return __atomic_load_n(&_value, int(m)); }
   4168a:	48 8b 05 97 88 01 00 	mov    0x18897(%rip),%rax        # 59f28 <ticks>
   41691:	8b 15 8d 88 01 00    	mov    0x1888d(%rip),%edx        # 59f24 <memshow()::last_ticks>
   41697:	48 29 d0             	sub    %rdx,%rax
   4169a:	48 83 f8 31          	cmp    $0x31,%rax
   4169e:	76 27                	jbe    416c7 <memshow()+0x4e>
   416a0:	48 8b 05 81 88 01 00 	mov    0x18881(%rip),%rax        # 59f28 <ticks>
        last_ticks = ticks;
   416a7:	89 05 77 88 01 00    	mov    %eax,0x18877(%rip)        # 59f24 <memshow()::last_ticks>
        showing = (showing + 1) % NPROC;
   416ad:	8b 05 6d 88 01 00    	mov    0x1886d(%rip),%eax        # 59f20 <memshow()::showing>
   416b3:	83 c0 01             	add    $0x1,%eax
   416b6:	99                   	cltd
   416b7:	c1 ea 1c             	shr    $0x1c,%edx
   416ba:	01 d0                	add    %edx,%eax
   416bc:	83 e0 0f             	and    $0xf,%eax
   416bf:	29 d0                	sub    %edx,%eax
   416c1:	89 05 59 88 01 00    	mov    %eax,0x18859(%rip)        # 59f20 <memshow()::showing>
    }

    proc* p = nullptr;
    for (int search = 0; !p && search < NPROC; ++search) {
   416c7:	8b 05 53 88 01 00    	mov    0x18853(%rip),%eax        # 59f20 <memshow()::showing>
void memshow() {
   416cd:	be 10 00 00 00       	mov    $0x10,%esi
   416d2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
   416d8:	bf 01 00 00 00       	mov    $0x1,%edi
   416dd:	eb 1d                	jmp    416fc <memshow()+0x83>
        if (ptable[showing].state != P_FREE
            && ptable[showing].pagetable) {
            p = &ptable[showing];
        } else {
            showing = (showing + 1) % NPROC;
   416df:	83 c0 01             	add    $0x1,%eax
   416e2:	89 c1                	mov    %eax,%ecx
   416e4:	c1 f9 1f             	sar    $0x1f,%ecx
   416e7:	c1 e9 1c             	shr    $0x1c,%ecx
   416ea:	8d 14 08             	lea    (%rax,%rcx,1),%edx
   416ed:	83 e2 0f             	and    $0xf,%edx
   416f0:	29 ca                	sub    %ecx,%edx
   416f2:	89 d0                	mov    %edx,%eax
    for (int search = 0; !p && search < NPROC; ++search) {
   416f4:	41 89 f8             	mov    %edi,%r8d
   416f7:	83 ee 01             	sub    $0x1,%esi
   416fa:	74 54                	je     41750 <memshow()+0xd7>
        if (ptable[showing].state != P_FREE
   416fc:	48 63 d0             	movslq %eax,%rdx
   416ff:	48 8d 0c 52          	lea    (%rdx,%rdx,2),%rcx
   41703:	48 8d 14 8a          	lea    (%rdx,%rcx,4),%rdx
   41707:	48 c1 e2 04          	shl    $0x4,%rdx
   4170b:	83 ba 2c 92 05 00 00 	cmpl   $0x0,0x5922c(%rdx)
   41712:	74 cb                	je     416df <memshow()+0x66>
            && ptable[showing].pagetable) {
   41714:	48 63 d0             	movslq %eax,%rdx
   41717:	48 8d 14 8a          	lea    (%rdx,%rcx,4),%rdx
   4171b:	48 c1 e2 04          	shl    $0x4,%rdx
   4171f:	48 83 ba 20 92 05 00 	cmpq   $0x0,0x59220(%rdx)
   41726:	00 
   41727:	74 b6                	je     416df <memshow()+0x66>
   41729:	45 84 c0             	test   %r8b,%r8b
   4172c:	74 06                	je     41734 <memshow()+0xbb>
   4172e:	89 05 ec 87 01 00    	mov    %eax,0x187ec(%rip)        # 59f20 <memshow()::showing>
            p = &ptable[showing];
   41734:	48 98                	cltq
   41736:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   4173a:	48 8d 3c 90          	lea    (%rax,%rdx,4),%rdi
   4173e:	48 c1 e7 04          	shl    $0x4,%rdi
   41742:	48 81 c7 20 92 05 00 	add    $0x59220,%rdi
        }
    }

    console_memviewer(p);
   41749:	e8 e2 2d 00 00       	call   44530 <console_memviewer(proc*)>
    if (!p) {
        console_printf(CPOS(10, 26), 0x0F00, "   VIRTUAL ADDRESS SPACE\n"
            "                          [All processes have exited]\n"
            "\n\n\n\n\n\n\n\n\n\n\n");
    }
}
   4174e:	5d                   	pop    %rbp
   4174f:	c3                   	ret
   41750:	89 15 ca 87 01 00    	mov    %edx,0x187ca(%rip)        # 59f20 <memshow()::showing>
    console_memviewer(p);
   41756:	bf 00 00 00 00       	mov    $0x0,%edi
   4175b:	e8 d0 2d 00 00       	call   44530 <console_memviewer(proc*)>
        console_printf(CPOS(10, 26), 0x0F00, "   VIRTUAL ADDRESS SPACE\n"
   41760:	ba f8 59 04 00       	mov    $0x459f8,%edx
   41765:	be 00 0f 00 00       	mov    $0xf00,%esi
   4176a:	bf 3a 03 00 00       	mov    $0x33a,%edi
   4176f:	b8 00 00 00 00       	mov    $0x0,%eax
   41774:	e8 06 3d 00 00       	call   4547f <console_printf(int, int, char const*, ...)>
}
   41779:	eb d3                	jmp    4174e <memshow()+0xd5>

000000000004177b <schedule()>:
void schedule() {
   4177b:	f3 0f 1e fa          	endbr64
   4177f:	55                   	push   %rbp
   41780:	48 89 e5             	mov    %rsp,%rbp
   41783:	41 54                	push   %r12
   41785:	53                   	push   %rbx
    pid_t pid = current->pid;
   41786:	48 8b 05 73 7a 01 00 	mov    0x17a73(%rip),%rax        # 59200 <current>
        pid = (pid + 1) % NPROC;
   4178d:	8b 40 08             	mov    0x8(%rax),%eax
   41790:	83 c0 01             	add    $0x1,%eax
   41793:	99                   	cltd
   41794:	c1 ea 1c             	shr    $0x1c,%edx
   41797:	01 d0                	add    %edx,%eax
   41799:	83 e0 0f             	and    $0xf,%eax
   4179c:	29 d0                	sub    %edx,%eax
   4179e:	41 89 c4             	mov    %eax,%r12d
        if (ptable[pid].state == P_RUNNABLE) {
   417a1:	48 98                	cltq
   417a3:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   417a7:	48 8d 04 90          	lea    (%rax,%rdx,4),%rax
   417ab:	48 c1 e0 04          	shl    $0x4,%rax
    for (unsigned spins = 1; true; ++spins) {
   417af:	bb 01 00 00 00       	mov    $0x1,%ebx
        if (ptable[pid].state == P_RUNNABLE) {
   417b4:	83 b8 2c 92 05 00 01 	cmpl   $0x1,0x5922c(%rax)
   417bb:	75 48                	jne    41805 <schedule()+0x8a>
            run(&ptable[pid]);
   417bd:	4d 63 e4             	movslq %r12d,%r12
   417c0:	4b 8d 04 64          	lea    (%r12,%r12,2),%rax
   417c4:	49 8d 3c 84          	lea    (%r12,%rax,4),%rdi
   417c8:	48 c1 e7 04          	shl    $0x4,%rdi
   417cc:	48 81 c7 20 92 05 00 	add    $0x59220,%rdi
   417d3:	e8 3a fc ff ff       	call   41412 <run(proc*)>
    for (unsigned spins = 1; true; ++spins) {
   417d8:	83 c3 01             	add    $0x1,%ebx
        pid = (pid + 1) % NPROC;
   417db:	41 8d 44 24 01       	lea    0x1(%r12),%eax
   417e0:	99                   	cltd
   417e1:	c1 ea 1c             	shr    $0x1c,%edx
   417e4:	01 d0                	add    %edx,%eax
   417e6:	83 e0 0f             	and    $0xf,%eax
   417e9:	29 d0                	sub    %edx,%eax
   417eb:	41 89 c4             	mov    %eax,%r12d
        if (ptable[pid].state == P_RUNNABLE) {
   417ee:	48 98                	cltq
   417f0:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   417f4:	48 8d 04 90          	lea    (%rax,%rdx,4),%rax
   417f8:	48 c1 e0 04          	shl    $0x4,%rax
   417fc:	83 b8 2c 92 05 00 01 	cmpl   $0x1,0x5922c(%rax)
   41803:	74 b8                	je     417bd <schedule()+0x42>
        check_keyboard();
   41805:	e8 55 1f 00 00       	call   4375f <check_keyboard()>
        if (spins % (1 << 12) == 0) {
   4180a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
   41810:	75 c6                	jne    417d8 <schedule()+0x5d>
            memshow();
   41812:	e8 62 fe ff ff       	call   41679 <memshow()>
            log_printf("%u\n", spins);
   41817:	89 de                	mov    %ebx,%esi
   41819:	bf 3d 56 04 00       	mov    $0x4563d,%edi
   4181e:	b8 00 00 00 00       	mov    $0x0,%eax
   41823:	e8 c4 10 00 00       	call   428ec <log_printf(char const*, ...)>
   41828:	eb ae                	jmp    417d8 <schedule()+0x5d>

000000000004182a <exception(regstate*)>:
void exception(regstate* regs) {
   4182a:	f3 0f 1e fa          	endbr64
   4182e:	55                   	push   %rbp
   4182f:	48 89 e5             	mov    %rsp,%rbp
   41832:	53                   	push   %rbx
   41833:	48 83 ec 08          	sub    $0x8,%rsp
   41837:	48 89 fe             	mov    %rdi,%rsi
    current->regs = *regs;
   4183a:	48 8b 1d bf 79 01 00 	mov    0x179bf(%rip),%rbx        # 59200 <current>
   41841:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   41845:	b9 18 00 00 00       	mov    $0x18,%ecx
   4184a:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    console_show_cursor(cursorpos);
   4184d:	8b 3d a9 77 07 00    	mov    0x777a9(%rip),%edi        # b8ffc <cursorpos>
   41853:	e8 e4 0e 00 00       	call   4273c <console_show_cursor(int)>
    if (regs->reg_intno != INT_PF || (regs->reg_errcode & PTE_U)) {
   41858:	83 bb 98 00 00 00 0e 	cmpl   $0xe,0x98(%rbx)
   4185f:	75 09                	jne    4186a <exception(regstate*)+0x40>
   41861:	f6 83 a0 00 00 00 04 	testb  $0x4,0xa0(%rbx)
   41868:	74 05                	je     4186f <exception(regstate*)+0x45>
        memshow();
   4186a:	e8 0a fe ff ff       	call   41679 <memshow()>
    check_keyboard();
   4186f:	e8 eb 1e 00 00       	call   4375f <check_keyboard()>
    switch (regs->reg_intno) {
   41874:	8b 93 98 00 00 00    	mov    0x98(%rbx),%edx
   4187a:	83 fa 0e             	cmp    $0xe,%edx
   4187d:	74 22                	je     418a1 <exception(regstate*)+0x77>
   4187f:	83 fa 20             	cmp    $0x20,%edx
   41882:	0f 85 ab 00 00 00    	jne    41933 <exception(regstate*)+0x109>
	T operator++() noexcept								{ return __atomic_add_fetch(&_value, 1, int(memory_order::seq_cst)); }
   41888:	f0 48 83 05 97 86 01 	lock addq $0x1,0x18697(%rip)        # 59f28 <ticks>
   4188f:	00 01 
}
inline uint32_t lapicstate::read(int reg) const {
    return reg_[reg].v;
}
inline void lapicstate::write(int reg, uint32_t v) {
    reg_[reg].v = v;
   41891:	b8 b0 00 e0 fe       	mov    $0xfee000b0,%eax
   41896:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
        schedule();
   4189c:	e8 da fe ff ff       	call   4177b <schedule()>
    asm volatile("movq %0, %%cr0" : : "r" (x));
}

__always_inline uintptr_t rdcr2() {
    uintptr_t x;
    asm volatile("movq %%cr2, %0" : "=r" (x));
   418a1:	0f 20 d2             	mov    %cr2,%rdx
        const char* operation = regs->reg_errcode & PTE_W
   418a4:	48 8b 83 a0 00 00 00 	mov    0xa0(%rbx),%rax
                ? "write" : "read";
   418ab:	a8 02                	test   $0x2,%al
   418ad:	b9 47 56 04 00       	mov    $0x45647,%ecx
   418b2:	be 41 56 04 00       	mov    $0x45641,%esi
   418b7:	48 0f 45 ce          	cmovne %rsi,%rcx
                ? "protection problem" : "missing page";
   418bb:	a8 01                	test   $0x1,%al
   418bd:	41 b8 5f 56 04 00    	mov    $0x4565f,%r8d
   418c3:	be 4c 56 04 00       	mov    $0x4564c,%esi
   418c8:	4c 0f 45 c6          	cmovne %rsi,%r8
        if (!(regs->reg_errcode & PTE_U)) {
   418cc:	a8 04                	test   $0x4,%al
   418ce:	75 1d                	jne    418ed <exception(regstate*)+0xc3>
            proc_panic(current, "Kernel page fault on %p (%s %s, rip=%p)!\n",
   418d0:	4c 8b 8b a8 00 00 00 	mov    0xa8(%rbx),%r9
   418d7:	be 58 5a 04 00       	mov    $0x45a58,%esi
   418dc:	48 8b 3d 1d 79 01 00 	mov    0x1791d(%rip),%rdi        # 59200 <current>
   418e3:	b8 00 00 00 00       	mov    $0x0,%eax
   418e8:	e8 8b 20 00 00       	call   43978 <proc_panic(proc const*, char const*, ...)>
        error_printf(CPOS(24, 0), 0x0C00,
   418ed:	48 8b 05 0c 79 01 00 	mov    0x1790c(%rip),%rax        # 59200 <current>
   418f4:	8b 40 08             	mov    0x8(%rax),%eax
   418f7:	ff b3 a8 00 00 00    	push   0xa8(%rbx)
   418fd:	41 50                	push   %r8
   418ff:	49 89 c9             	mov    %rcx,%r9
   41902:	49 89 d0             	mov    %rdx,%r8
   41905:	89 c1                	mov    %eax,%ecx
   41907:	ba 88 5a 04 00       	mov    $0x45a88,%edx
   4190c:	be 00 0c 00 00       	mov    $0xc00,%esi
   41911:	bf 80 07 00 00       	mov    $0x780,%edi
   41916:	b8 00 00 00 00       	mov    $0x0,%eax
   4191b:	e8 99 3b 00 00       	call   454b9 <error_printf(int, int, char const*, ...)>
        current->state = P_FAULTED;
   41920:	48 8b 05 d9 78 01 00 	mov    0x178d9(%rip),%rax        # 59200 <current>
   41927:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%rax)
        schedule();
   4192e:	e8 48 fe ff ff       	call   4177b <schedule()>
        proc_panic(current, "Unhandled exception %d (rip=%p)!\n",
   41933:	48 8b 8b a8 00 00 00 	mov    0xa8(%rbx),%rcx
   4193a:	be b8 5a 04 00       	mov    $0x45ab8,%esi
   4193f:	48 8b 3d ba 78 01 00 	mov    0x178ba(%rip),%rdi        # 59200 <current>
   41946:	b8 00 00 00 00       	mov    $0x0,%eax
   4194b:	e8 28 20 00 00       	call   43978 <proc_panic(proc const*, char const*, ...)>

0000000000041950 <syscall(regstate*)>:
uintptr_t syscall(regstate* regs) {
   41950:	f3 0f 1e fa          	endbr64
   41954:	55                   	push   %rbp
   41955:	48 89 e5             	mov    %rsp,%rbp
   41958:	41 57                	push   %r15
   4195a:	41 56                	push   %r14
   4195c:	41 55                	push   %r13
   4195e:	41 54                	push   %r12
   41960:	53                   	push   %rbx
   41961:	48 83 ec 58          	sub    $0x58,%rsp
   41965:	48 89 fe             	mov    %rdi,%rsi
    current->regs = *regs;
   41968:	48 8b 1d 91 78 01 00 	mov    0x17891(%rip),%rbx        # 59200 <current>
   4196f:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   41973:	b9 18 00 00 00       	mov    $0x18,%ecx
   41978:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    console_show_cursor(cursorpos);
   4197b:	8b 3d 7b 76 07 00    	mov    0x7767b(%rip),%edi        # b8ffc <cursorpos>
   41981:	e8 b6 0d 00 00       	call   4273c <console_show_cursor(int)>
    memshow();
   41986:	e8 ee fc ff ff       	call   41679 <memshow()>
    check_keyboard();
   4198b:	e8 cf 1d 00 00       	call   4375f <check_keyboard()>
    switch (regs->reg_rax) {
   41990:	48 8b 53 10          	mov    0x10(%rbx),%rdx
   41994:	48 83 fa 06          	cmp    $0x6,%rdx
   41998:	0f 87 fe 05 00 00    	ja     41f9c <syscall(regstate*)+0x64c>
   4199e:	3e ff 24 d5 70 5f 04 	notrack jmp *0x45f70(,%rdx,8)
   419a5:	00 
        user_panic(current);
   419a6:	48 8b 3d 53 78 01 00 	mov    0x17853(%rip),%rdi        # 59200 <current>
   419ad:	e8 d3 1e 00 00       	call   43885 <user_panic(proc const*)>
        return current->pid;
   419b2:	48 8b 05 47 78 01 00 	mov    0x17847(%rip),%rax        # 59200 <current>
   419b9:	48 63 40 08          	movslq 0x8(%rax),%rax
}
   419bd:	48 83 c4 58          	add    $0x58,%rsp
   419c1:	5b                   	pop    %rbx
   419c2:	41 5c                	pop    %r12
   419c4:	41 5d                	pop    %r13
   419c6:	41 5e                	pop    %r14
   419c8:	41 5f                	pop    %r15
   419ca:	5d                   	pop    %rbp
   419cb:	c3                   	ret
        current->regs.reg_rax = 0;
   419cc:	48 8b 05 2d 78 01 00 	mov    0x1782d(%rip),%rax        # 59200 <current>
   419d3:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
   419da:	00 
        schedule();             // does not return
   419db:	e8 9b fd ff ff       	call   4177b <schedule()>
        return syscall_page_alloc(current->regs.reg_rdi);
   419e0:	48 8b 05 19 78 01 00 	mov    0x17819(%rip),%rax        # 59200 <current>
   419e7:	48 8b 78 40          	mov    0x40(%rax),%rdi
   419eb:	e8 54 f9 ff ff       	call   41344 <syscall_page_alloc(unsigned long)>
   419f0:	48 98                	cltq
   419f2:	eb c9                	jmp    419bd <syscall(regstate*)+0x6d>
   419f4:	b8 fc 92 05 00       	mov    $0x592fc,%eax
        for(pid_t i = 1; i< NPROC; i++)
   419f9:	41 bc 01 00 00 00    	mov    $0x1,%r12d
            if(ptable[i].state == P_FREE)
   419ff:	83 38 00             	cmpl   $0x0,(%rax)
   41a02:	74 19                	je     41a1d <syscall(regstate*)+0xcd>
        for(pid_t i = 1; i< NPROC; i++)
   41a04:	41 83 c4 01          	add    $0x1,%r12d
   41a08:	48 05 d0 00 00 00    	add    $0xd0,%rax
   41a0e:	41 83 fc 10          	cmp    $0x10,%r12d
   41a12:	75 eb                	jne    419ff <syscall(regstate*)+0xaf>
        if(child_pid<0){return -1;}
   41a14:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   41a1b:	eb a0                	jmp    419bd <syscall(regstate*)+0x6d>
   41a1d:	45 85 e4             	test   %r12d,%r12d
   41a20:	0f 88 96 05 00 00    	js     41fbc <syscall(regstate*)+0x66c>
        x86_64_pagetable * child_pt = (x86_64_pagetable*) kalloc(PAGESIZE);
   41a26:	bf 00 10 00 00       	mov    $0x1000,%edi
   41a2b:	e8 89 f1 ff ff       	call   40bb9 <kalloc(unsigned long)>
   41a30:	49 89 c5             	mov    %rax,%r13
        if(!child_pt){return -1;}
   41a33:	48 85 c0             	test   %rax,%rax
   41a36:	0f 84 8c 05 00 00    	je     41fc8 <syscall(regstate*)+0x678>
        memset(child_pt, 0, PAGESIZE);
   41a3c:	ba 00 10 00 00       	mov    $0x1000,%edx
   41a41:	be 00 00 00 00       	mov    $0x0,%esi
   41a46:	48 89 c7             	mov    %rax,%rdi
   41a49:	e8 f2 2d 00 00       	call   44840 <memset>
        for(vmiter it(current->pagetable, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE)
   41a4e:	48 8b 05 ab 77 01 00 	mov    0x177ab(%rip),%rax        # 59200 <current>
   41a55:	48 8b 00             	mov    (%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   41a58:	48 89 45 90          	mov    %rax,-0x70(%rbp)
   41a5c:	48 89 45 98          	mov    %rax,-0x68(%rbp)
   41a60:	c7 45 a0 03 00 00 00 	movl   $0x3,-0x60(%rbp)
   41a67:	c7 45 a4 ff 0f 00 00 	movl   $0xfff,-0x5c(%rbp)
   41a6e:	48 c7 45 a8 00 00 00 	movq   $0x0,-0x58(%rbp)
   41a75:	00 
    real_find(va);
   41a76:	be 00 00 00 00       	mov    $0x0,%esi
   41a7b:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   41a7f:	e8 e8 05 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   41a84:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
   41a88:	48 81 fe ff ff 2f 00 	cmp    $0x2fffff,%rsi
   41a8f:	0f 87 e7 02 00 00    	ja     41d7c <syscall(regstate*)+0x42c>
        return -1;
   41a95:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
            pa &= ~0x1000UL;
   41a9c:	49 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r14
   41aa3:	ff 0f 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41aa6:	49 bf 00 f0 ff ff ff 	movabs $0xffffffffff000,%r15
   41aad:	ff 0f 00 
   41ab0:	e9 a7 01 00 00       	jmp    41c5c <syscall(regstate*)+0x30c>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   41ab5:	4c 89 6d b0          	mov    %r13,-0x50(%rbp)
   41ab9:	4c 89 6d b8          	mov    %r13,-0x48(%rbp)
   41abd:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   41ac4:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   41acb:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   41ad2:	00 
    real_find(va);
   41ad3:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41ad7:	e8 90 05 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    uint64_t ph = *pep_ & perm_;
   41adc:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   41ae0:	48 8b 00             	mov    (%rax),%rax
   41ae3:	48 63 4d a4          	movslq -0x5c(%rbp),%rcx
   41ae7:	48 21 c1             	and    %rax,%rcx
    return ph & -(ph & PTE_P);
   41aea:	48 89 ca             	mov    %rcx,%rdx
   41aed:	83 e2 01             	and    $0x1,%edx
   41af0:	48 f7 da             	neg    %rdx
            int r = vmiter(child_pt, it.va()).try_map(it.pa(), it.perm());
   41af3:	21 ca                	and    %ecx,%edx
        return -1;
   41af5:	48 89 de             	mov    %rbx,%rsi
    if (*pep_ & PTE_P) {
   41af8:	a8 01                	test   $0x1,%al
   41afa:	74 23                	je     41b1f <syscall(regstate*)+0x1cf>
        if (level_ > 0) {
   41afc:	8b 4d a0             	mov    -0x60(%rbp),%ecx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41aff:	48 89 c7             	mov    %rax,%rdi
   41b02:	4c 21 ff             	and    %r15,%rdi
   41b05:	4c 21 f0             	and    %r14,%rax
   41b08:	85 c9                	test   %ecx,%ecx
   41b0a:	48 0f 4f f8          	cmovg  %rax,%rdi
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   41b0e:	8d 4c c9 0c          	lea    0xc(%rcx,%rcx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   41b12:	48 d3 e6             	shl    %cl,%rsi
   41b15:	48 f7 d6             	not    %rsi
   41b18:	48 23 75 a8          	and    -0x58(%rbp),%rsi
   41b1c:	48 01 fe             	add    %rdi,%rsi
   41b1f:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41b23:	e8 5a 07 00 00       	call   42282 <vmiter::try_map(unsigned long, int)>
            if (r != 0) {goto fork_fail;}
   41b28:	85 c0                	test   %eax,%eax
   41b2a:	0f 84 07 01 00 00    	je     41c37 <syscall(regstate*)+0x2e7>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   41b30:	4c 89 6d b0          	mov    %r13,-0x50(%rbp)
   41b34:	4c 89 6d b8          	mov    %r13,-0x48(%rbp)
   41b38:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   41b3f:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   41b46:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   41b4d:	00 
    real_find(va);
   41b4e:	be 00 00 00 00       	mov    $0x0,%esi
   41b53:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41b57:	e8 10 05 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   41b5c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
            for (vmiter it(child_pt, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE) {
   41b60:	48 81 fa ff ff 2f 00 	cmp    $0x2fffff,%rdx
   41b67:	0f 87 03 03 00 00    	ja     41e70 <syscall(regstate*)+0x520>
        return -1;
   41b6d:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
   41b74:	e9 ae 02 00 00       	jmp    41e27 <syscall(regstate*)+0x4d7>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   41b79:	4c 89 6d b0          	mov    %r13,-0x50(%rbp)
   41b7d:	4c 89 6d b8          	mov    %r13,-0x48(%rbp)
   41b81:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   41b88:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   41b8f:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   41b96:	00 
    real_find(va);
   41b97:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41b9b:	e8 cc 04 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    uint64_t ph = *pep_ & perm_;
   41ba0:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   41ba4:	48 8b 00             	mov    (%rax),%rax
   41ba7:	48 63 4d a4          	movslq -0x5c(%rbp),%rcx
   41bab:	48 21 c1             	and    %rax,%rcx
    return ph & -(ph & PTE_P);
   41bae:	48 89 ca             	mov    %rcx,%rdx
   41bb1:	83 e2 01             	and    $0x1,%edx
   41bb4:	48 f7 da             	neg    %rdx
            int r = vmiter(child_pt, it.va()).try_map(it.pa(), it.perm());
   41bb7:	21 ca                	and    %ecx,%edx
        return -1;
   41bb9:	48 89 de             	mov    %rbx,%rsi
    if (*pep_ & PTE_P) {
   41bbc:	a8 01                	test   $0x1,%al
   41bbe:	74 23                	je     41be3 <syscall(regstate*)+0x293>
        if (level_ > 0) {
   41bc0:	8b 4d a0             	mov    -0x60(%rbp),%ecx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41bc3:	48 89 c7             	mov    %rax,%rdi
   41bc6:	4c 21 ff             	and    %r15,%rdi
   41bc9:	4c 21 f0             	and    %r14,%rax
   41bcc:	85 c9                	test   %ecx,%ecx
   41bce:	48 0f 4f f8          	cmovg  %rax,%rdi
   41bd2:	8d 4c c9 0c          	lea    0xc(%rcx,%rcx,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   41bd6:	48 d3 e6             	shl    %cl,%rsi
   41bd9:	48 f7 d6             	not    %rsi
   41bdc:	48 23 75 a8          	and    -0x58(%rbp),%rsi
   41be0:	48 01 fe             	add    %rdi,%rsi
   41be3:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41be7:	e8 96 06 00 00       	call   42282 <vmiter::try_map(unsigned long, int)>
            if (r != 0) {goto fork_fail;}
   41bec:	85 c0                	test   %eax,%eax
   41bee:	0f 85 3c ff ff ff    	jne    41b30 <syscall(regstate*)+0x1e0>
    if (*pep_ & PTE_P) {
   41bf4:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   41bf8:	48 8b 10             	mov    (%rax),%rdx
        return -1;
   41bfb:	48 89 d8             	mov    %rbx,%rax
    if (*pep_ & PTE_P) {
   41bfe:	f6 c2 01             	test   $0x1,%dl
   41c01:	74 29                	je     41c2c <syscall(regstate*)+0x2dc>
        if (level_ > 0) {
   41c03:	8b 45 a0             	mov    -0x60(%rbp),%eax
            pa &= ~0x1000UL;
   41c06:	48 89 d1             	mov    %rdx,%rcx
   41c09:	4c 21 f1             	and    %r14,%rcx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41c0c:	48 89 d6             	mov    %rdx,%rsi
   41c0f:	4c 21 fe             	and    %r15,%rsi
   41c12:	85 c0                	test   %eax,%eax
   41c14:	48 0f 4f f1          	cmovg  %rcx,%rsi
   41c18:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   41c1c:	48 89 d8             	mov    %rbx,%rax
   41c1f:	48 d3 e0             	shl    %cl,%rax
   41c22:	48 f7 d0             	not    %rax
   41c25:	48 23 45 a8          	and    -0x58(%rbp),%rax
   41c29:	48 01 f0             	add    %rsi,%rax
            ++physpages[it.pa() / PAGESIZE].refcount;
   41c2c:	48 c1 e8 0c          	shr    $0xc,%rax
   41c30:	80 80 00 90 05 00 01 	addb   $0x1,0x59000(%rax)
    return find(va_ + delta);
   41c37:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   41c3b:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   41c42:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   41c46:	e8 21 04 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   41c4b:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
        for(vmiter it(current->pagetable, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE)
   41c4f:	48 81 fe ff ff 2f 00 	cmp    $0x2fffff,%rsi
   41c56:	0f 87 20 01 00 00    	ja     41d7c <syscall(regstate*)+0x42c>
    uint64_t ph = *pep_ & perm_;
   41c5c:	48 63 55 a4          	movslq -0x5c(%rbp),%rdx
   41c60:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   41c64:	48 23 10             	and    (%rax),%rdx
    return ph & -(ph & PTE_P);
   41c67:	48 89 d0             	mov    %rdx,%rax
   41c6a:	83 e0 01             	and    $0x1,%eax
   41c6d:	48 f7 d8             	neg    %rax
   41c70:	48 21 d0             	and    %rdx,%rax
            if(!it.present()){continue;}
   41c73:	a8 01                	test   $0x1,%al
   41c75:	74 c0                	je     41c37 <syscall(regstate*)+0x2e7>
            if (it.va() < PROC_START_ADDR) {
   41c77:	48 81 fe ff ff 0f 00 	cmp    $0xfffff,%rsi
   41c7e:	0f 86 31 fe ff ff    	jbe    41ab5 <syscall(regstate*)+0x165>
        } else if (it.user() && it.writable()) {
   41c84:	48 89 c2             	mov    %rax,%rdx
   41c87:	48 f7 d2             	not    %rdx
   41c8a:	f6 c2 05             	test   $0x5,%dl
   41c8d:	0f 85 e6 fe ff ff    	jne    41b79 <syscall(regstate*)+0x229>
   41c93:	f6 c2 03             	test   $0x3,%dl
   41c96:	0f 85 dd fe ff ff    	jne    41b79 <syscall(regstate*)+0x229>
            void* pa = kalloc(PAGESIZE);
   41c9c:	bf 00 10 00 00       	mov    $0x1000,%edi
   41ca1:	e8 13 ef ff ff       	call   40bb9 <kalloc(unsigned long)>
   41ca6:	48 89 45 88          	mov    %rax,-0x78(%rbp)
            if (!pa) {goto fork_fail;}
   41caa:	48 85 c0             	test   %rax,%rax
   41cad:	0f 84 7d fe ff ff    	je     41b30 <syscall(regstate*)+0x1e0>
    if (*pep_ & PTE_P) {
   41cb3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
   41cb7:	48 8b 08             	mov    (%rax),%rcx
        return -1;
   41cba:	48 89 de             	mov    %rbx,%rsi
    if (*pep_ & PTE_P) {
   41cbd:	f6 c1 01             	test   $0x1,%cl
   41cc0:	74 33                	je     41cf5 <syscall(regstate*)+0x3a5>
        if (level_ > 0) {
   41cc2:	8b 45 a0             	mov    -0x60(%rbp),%eax
            pa &= ~0x1000UL;
   41cc5:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   41ccc:	ff 0f 00 
   41ccf:	48 21 ca             	and    %rcx,%rdx
        if (level_ > 0) {
   41cd2:	85 c0                	test   %eax,%eax
   41cd4:	0f 8e 90 00 00 00    	jle    41d6a <syscall(regstate*)+0x41a>
   41cda:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   41cde:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   41ce5:	48 d3 e0             	shl    %cl,%rax
   41ce8:	48 89 c6             	mov    %rax,%rsi
   41ceb:	48 f7 d6             	not    %rsi
   41cee:	48 23 75 a8          	and    -0x58(%rbp),%rsi
   41cf2:	48 01 d6             	add    %rdx,%rsi
            memcpy(pa, (void*) it.pa(), PAGESIZE);
   41cf5:	ba 00 10 00 00       	mov    $0x1000,%edx
   41cfa:	48 8b 7d 88          	mov    -0x78(%rbp),%rdi
   41cfe:	e8 19 2b 00 00       	call   4481c <memcpy>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   41d03:	4c 89 6d b0          	mov    %r13,-0x50(%rbp)
   41d07:	4c 89 6d b8          	mov    %r13,-0x48(%rbp)
   41d0b:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   41d12:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   41d19:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   41d20:	00 
    real_find(va);
   41d21:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
   41d25:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
   41d29:	48 89 c7             	mov    %rax,%rdi
   41d2c:	e8 3b 03 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    uint64_t ph = *pep_ & perm_;
   41d31:	48 63 45 a4          	movslq -0x5c(%rbp),%rax
   41d35:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
   41d39:	48 23 02             	and    (%rdx),%rax
    return ph & -(ph & PTE_P);
   41d3c:	48 89 c2             	mov    %rax,%rdx
   41d3f:	83 e2 01             	and    $0x1,%edx
   41d42:	48 f7 da             	neg    %rdx
    return try_map((uintptr_t) kp, perm);
   41d45:	21 c2                	and    %eax,%edx
   41d47:	48 8b 75 88          	mov    -0x78(%rbp),%rsi
   41d4b:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41d4f:	e8 2e 05 00 00       	call   42282 <vmiter::try_map(unsigned long, int)>
            if (r != 0) { kfree(pa); goto fork_fail; }
   41d54:	85 c0                	test   %eax,%eax
   41d56:	0f 84 db fe ff ff    	je     41c37 <syscall(regstate*)+0x2e7>
   41d5c:	48 8b 7d 88          	mov    -0x78(%rbp),%rdi
   41d60:	e8 a0 f5 ff ff       	call   41305 <kfree(void*)>
   41d65:	e9 c6 fd ff ff       	jmp    41b30 <syscall(regstate*)+0x1e0>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41d6a:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   41d71:	ff 0f 00 
   41d74:	48 21 ca             	and    %rcx,%rdx
   41d77:	e9 5e ff ff ff       	jmp    41cda <syscall(regstate*)+0x38a>
        ptable[child_pid].pagetable = child_pt;
   41d7c:	49 63 c4             	movslq %r12d,%rax
   41d7f:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
   41d83:	48 c1 e2 02          	shl    $0x2,%rdx
   41d87:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
   41d8b:	48 c1 e1 04          	shl    $0x4,%rcx
   41d8f:	4c 89 a9 20 92 05 00 	mov    %r13,0x59220(%rcx)
        ptable[child_pid].regs = current->regs;
   41d96:	49 89 c8             	mov    %rcx,%r8
   41d99:	49 81 c0 30 92 05 00 	add    $0x59230,%r8
   41da0:	48 8b 1d 59 74 01 00 	mov    0x17459(%rip),%rbx        # 59200 <current>
   41da7:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   41dab:	b9 18 00 00 00       	mov    $0x18,%ecx
   41db0:	4c 89 c7             	mov    %r8,%rdi
   41db3:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
        ptable[child_pid].regs.reg_rax = 0;
   41db6:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
   41dba:	48 c1 e1 04          	shl    $0x4,%rcx
   41dbe:	48 c7 81 30 92 05 00 	movq   $0x0,0x59230(%rcx)
   41dc5:	00 00 00 00 
        ptable[child_pid].state = P_RUNNABLE;
   41dc9:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
   41dcd:	48 c1 e1 04          	shl    $0x4,%rcx
   41dd1:	c7 81 2c 92 05 00 01 	movl   $0x1,0x5922c(%rcx)
   41dd8:	00 00 00 
        ptable[child_pid].pid = child_pid;
   41ddb:	44 89 a1 28 92 05 00 	mov    %r12d,0x59228(%rcx)
        return child_pid;
   41de2:	e9 d6 fb ff ff       	jmp    419bd <syscall(regstate*)+0x6d>
   41de7:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   41deb:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   41df2:	48 d3 e0             	shl    %cl,%rax
   41df5:	48 89 c7             	mov    %rax,%rdi
   41df8:	48 f7 d7             	not    %rdi
   41dfb:	48 21 d7             	and    %rdx,%rdi
   41dfe:	48 01 f7             	add    %rsi,%rdi
                    kfree((void*) it.pa());
   41e01:	e8 ff f4 ff ff       	call   41305 <kfree(void*)>
    return find(va_ + delta);
   41e06:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41e0a:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   41e11:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41e15:	e8 52 02 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   41e1a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
            for (vmiter it(child_pt, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE) {
   41e1e:	48 81 fa ff ff 2f 00 	cmp    $0x2fffff,%rdx
   41e25:	77 49                	ja     41e70 <syscall(regstate*)+0x520>
    uint64_t ph = *pep_ & perm_;
   41e27:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41e2b:	48 8b 08             	mov    (%rax),%rcx
   41e2e:	48 63 45 c4          	movslq -0x3c(%rbp),%rax
   41e32:	48 21 c8             	and    %rcx,%rax
                if (it.present() && it.va() >= PROC_START_ADDR && it.va() != CONSOLE_ADDR) {
   41e35:	a8 01                	test   $0x1,%al
   41e37:	74 cd                	je     41e06 <syscall(regstate*)+0x4b6>
   41e39:	48 81 fa ff ff 0f 00 	cmp    $0xfffff,%rdx
   41e40:	76 c4                	jbe    41e06 <syscall(regstate*)+0x4b6>
        return -1;
   41e42:	48 89 df             	mov    %rbx,%rdi
    if (*pep_ & PTE_P) {
   41e45:	f6 c1 01             	test   $0x1,%cl
   41e48:	74 b7                	je     41e01 <syscall(regstate*)+0x4b1>
        if (level_ > 0) {
   41e4a:	8b 45 c0             	mov    -0x40(%rbp),%eax
            pa &= ~0x1000UL;
   41e4d:	48 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rsi
   41e54:	ff 0f 00 
   41e57:	48 21 ce             	and    %rcx,%rsi
        if (level_ > 0) {
   41e5a:	85 c0                	test   %eax,%eax
   41e5c:	7f 89                	jg     41de7 <syscall(regstate*)+0x497>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41e5e:	48 be 00 f0 ff ff ff 	movabs $0xffffffffff000,%rsi
   41e65:	ff 0f 00 
   41e68:	48 21 ce             	and    %rcx,%rsi
   41e6b:	e9 77 ff ff ff       	jmp    41de7 <syscall(regstate*)+0x497>
            kfree(child_pt);
   41e70:	4c 89 ef             	mov    %r13,%rdi
   41e73:	e8 8d f4 ff ff       	call   41305 <kfree(void*)>
            return -1;
   41e78:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   41e7f:	e9 39 fb ff ff       	jmp    419bd <syscall(regstate*)+0x6d>
        for (vmiter it(current->pagetable, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE) {
   41e84:	48 8b 05 75 73 01 00 	mov    0x17375(%rip),%rax        # 59200 <current>
   41e8b:	48 8b 00             	mov    (%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   41e8e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   41e92:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   41e96:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   41e9d:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   41ea4:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   41eab:	00 
    real_find(va);
   41eac:	be 00 00 00 00       	mov    $0x0,%esi
   41eb1:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41eb5:	e8 b2 01 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   41eba:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41ebe:	48 3d ff ff 2f 00    	cmp    $0x2fffff,%rax
   41ec4:	0f 86 a7 00 00 00    	jbe    41f71 <syscall(regstate*)+0x621>
        for (ptiter it(current->pagetable); !it.done(); it.next()) {
   41eca:	48 8b 05 2f 73 01 00 	mov    0x1732f(%rip),%rax        # 59200 <current>
   41ed1:	48 8b 30             	mov    (%rax),%rsi
   41ed4:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41ed8:	e8 47 06 00 00       	call   42524 <ptiter::ptiter(x86_64_pagetable*)>
   41edd:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffff,%rax
   41ee4:	ff 00 00 
   41ee7:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
   41eeb:	72 30                	jb     41f1d <syscall(regstate*)+0x5cd>
}
inline void ptiter::next() {
    down(true);
}
inline uintptr_t ptiter::pa() const {
    return *pep_ & PTE_PAMASK;
   41eed:	49 bc 00 f0 ff ff ff 	movabs $0xffffffffff000,%r12
   41ef4:	ff 0f 00 
   41ef7:	48 89 c3             	mov    %rax,%rbx
   41efa:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41efe:	4c 89 e7             	mov    %r12,%rdi
   41f01:	48 23 38             	and    (%rax),%rdi
            kfree((void*) it.pa());
   41f04:	e8 fc f3 ff ff       	call   41305 <kfree(void*)>
    down(true);
   41f09:	be 01 00 00 00       	mov    $0x1,%esi
   41f0e:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41f12:	e8 19 05 00 00       	call   42430 <ptiter::down(bool)>
        for (ptiter it(current->pagetable); !it.done(); it.next()) {
   41f17:	48 3b 5d c8          	cmp    -0x38(%rbp),%rbx
   41f1b:	73 dd                	jae    41efa <syscall(regstate*)+0x5aa>
        kfree(current->pagetable);
   41f1d:	48 8b 05 dc 72 01 00 	mov    0x172dc(%rip),%rax        # 59200 <current>
   41f24:	48 8b 38             	mov    (%rax),%rdi
   41f27:	e8 d9 f3 ff ff       	call   41305 <kfree(void*)>
        current->pagetable = nullptr;
   41f2c:	48 8b 05 cd 72 01 00 	mov    0x172cd(%rip),%rax        # 59200 <current>
   41f33:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
        current->state = P_FREE;
   41f3a:	48 8b 05 bf 72 01 00 	mov    0x172bf(%rip),%rax        # 59200 <current>
   41f41:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%rax)
        schedule();
   41f48:	e8 2e f8 ff ff       	call   4177b <schedule()>
    return find(va_ + delta);
   41f4d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   41f51:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   41f58:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41f5c:	e8 0b 01 00 00       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   41f61:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
        for (vmiter it(current->pagetable, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE) {
   41f65:	48 3d ff ff 2f 00    	cmp    $0x2fffff,%rax
   41f6b:	0f 87 59 ff ff ff    	ja     41eca <syscall(regstate*)+0x57a>
    uint64_t ph = *pep_ & perm_;
   41f71:	48 63 55 c4          	movslq -0x3c(%rbp),%rdx
   41f75:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
   41f79:	48 23 11             	and    (%rcx),%rdx
            if (it.present() && it.va() >= PROC_START_ADDR && it.va() != CONSOLE_ADDR) {
   41f7c:	f6 c2 01             	test   $0x1,%dl
   41f7f:	74 cc                	je     41f4d <syscall(regstate*)+0x5fd>
   41f81:	48 3d ff ff 0f 00    	cmp    $0xfffff,%rax
   41f87:	76 c4                	jbe    41f4d <syscall(regstate*)+0x5fd>
                kfree((void*) it.pa());
   41f89:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41f8d:	e8 d4 eb ff ff       	call   40b66 <vmiter::pa() const>
   41f92:	48 89 c7             	mov    %rax,%rdi
   41f95:	e8 6b f3 ff ff       	call   41305 <kfree(void*)>
   41f9a:	eb b1                	jmp    41f4d <syscall(regstate*)+0x5fd>
        proc_panic(current, "Unhandled system call %ld (pid=%d, rip=%p)!\n",
   41f9c:	48 8b 3d 5d 72 01 00 	mov    0x1725d(%rip),%rdi        # 59200 <current>
   41fa3:	8b 4f 08             	mov    0x8(%rdi),%ecx
   41fa6:	4c 8b 83 a8 00 00 00 	mov    0xa8(%rbx),%r8
   41fad:	be e0 5a 04 00       	mov    $0x45ae0,%esi
   41fb2:	b8 00 00 00 00       	mov    $0x0,%eax
   41fb7:	e8 bc 19 00 00       	call   43978 <proc_panic(proc const*, char const*, ...)>
        if(child_pid<0){return -1;}
   41fbc:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   41fc3:	e9 f5 f9 ff ff       	jmp    419bd <syscall(regstate*)+0x6d>
        if(!child_pt){return -1;}
   41fc8:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   41fcf:	e9 e9 f9 ff ff       	jmp    419bd <syscall(regstate*)+0x6d>

0000000000041fd4 <vmiter::down()>:
    } else {
        return 0;
    }
}

void vmiter::down() {
   41fd4:	f3 0f 1e fa          	endbr64
   41fd8:	48 89 f8             	mov    %rdi,%rax
    while (level_ > 0 && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   41fdb:	8b 77 10             	mov    0x10(%rdi),%esi
   41fde:	85 f6                	test   %esi,%esi
   41fe0:	7e 56                	jle    42038 <vmiter::down()+0x64>
   41fe2:	8d 4c f6 03          	lea    0x3(%rsi,%rsi,8),%ecx
        perm_ &= *pep_ | ~(PTE_P | PTE_W | PTE_U);
        --level_;
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41fe6:	49 b9 00 f0 ff ff ff 	movabs $0xffffffffff000,%r9
   41fed:	ff 0f 00 
    while (level_ > 0 && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   41ff0:	48 8b 78 08          	mov    0x8(%rax),%rdi
   41ff4:	48 8b 17             	mov    (%rdi),%rdx
   41ff7:	49 89 d0             	mov    %rdx,%r8
   41ffa:	41 81 e0 81 00 00 00 	and    $0x81,%r8d
   42001:	49 83 f8 01          	cmp    $0x1,%r8
   42005:	75 31                	jne    42038 <vmiter::down()+0x64>
        perm_ &= *pep_ | ~(PTE_P | PTE_W | PTE_U);
   42007:	83 ca f8             	or     $0xfffffff8,%edx
   4200a:	21 50 14             	and    %edx,0x14(%rax)
        --level_;
   4200d:	83 ee 01             	sub    $0x1,%esi
   42010:	89 70 10             	mov    %esi,0x10(%rax)
        uintptr_t pa = *pep_ & PTE_PAMASK;
   42013:	4c 89 ca             	mov    %r9,%rdx
   42016:	48 23 17             	and    (%rdi),%rdx
   42019:	48 89 d7             	mov    %rdx,%rdi
    return (int) (addr >> (PAGEOFFBITS + level * PAGEINDEXBITS)) & 0x1FF;
   4201c:	48 8b 50 18          	mov    0x18(%rax),%rdx
   42020:	48 d3 ea             	shr    %cl,%rdx
        x86_64_pagetable* pt = reinterpret_cast<x86_64_pagetable*>(pa);
        pep_ = &pt->entry[pageindex(va_, level_)];
   42023:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
   42029:	48 8d 14 d7          	lea    (%rdi,%rdx,8),%rdx
   4202d:	48 89 50 08          	mov    %rdx,0x8(%rax)
    while (level_ > 0 && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   42031:	83 e9 09             	sub    $0x9,%ecx
   42034:	85 f6                	test   %esi,%esi
   42036:	75 b8                	jne    41ff0 <vmiter::down()+0x1c>
    }
    if ((*pep_ & PTE_PAMASK) >= 0x100000000UL) {
   42038:	48 8b 50 08          	mov    0x8(%rax),%rdx
   4203c:	48 8b 0a             	mov    (%rdx),%rcx
   4203f:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   42046:	ff 0f 00 
   42049:	48 21 ca             	and    %rcx,%rdx
   4204c:	48 c1 ea 20          	shr    $0x20,%rdx
   42050:	75 01                	jne    42053 <vmiter::down()+0x7f>
   42052:	c3                   	ret
void vmiter::down() {
   42053:	55                   	push   %rbp
   42054:	48 89 e5             	mov    %rsp,%rbp
        panic("Page table %p may contain uninitialized memory!\n"
   42057:	48 89 ca             	mov    %rcx,%rdx
   4205a:	48 8b 30             	mov    (%rax),%rsi
   4205d:	bf 10 5b 04 00       	mov    $0x45b10,%edi
   42062:	b8 00 00 00 00       	mov    $0x0,%eax
   42067:	e8 91 19 00 00       	call   439fd <panic(char const*, ...)>

000000000004206c <vmiter::real_find(unsigned long)>:
              "(Page table contents: %p)\n", pt_, *pep_);
    }
}

void vmiter::real_find(uintptr_t va) {
   4206c:	f3 0f 1e fa          	endbr64
   42070:	55                   	push   %rbp
   42071:	48 89 e5             	mov    %rsp,%rbp
   42074:	48 89 f0             	mov    %rsi,%rax
    if (level_ == 3 || ((va_ ^ va) & ~pageoffmask(level_ + 1)) != 0) {
   42077:	8b 57 10             	mov    0x10(%rdi),%edx
   4207a:	83 fa 03             	cmp    $0x3,%edx
   4207d:	74 1d                	je     4209c <vmiter::real_find(unsigned long)+0x30>
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   4207f:	8d 74 d2 09          	lea    0x9(%rdx,%rdx,8),%esi
   42083:	8d 4e 0c             	lea    0xc(%rsi),%ecx
   42086:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
   4208d:	48 d3 e2             	shl    %cl,%rdx
   42090:	48 89 c1             	mov    %rax,%rcx
   42093:	48 33 4f 18          	xor    0x18(%rdi),%rcx
   42097:	48 85 ca             	test   %rcx,%rdx
   4209a:	74 31                	je     420cd <vmiter::real_find(unsigned long)+0x61>
        level_ = 3;
   4209c:	c7 47 10 03 00 00 00 	movl   $0x3,0x10(%rdi)
    return va <= VA_LOWMAX || va >= VA_HIGHMIN;
   420a3:	48 ba 00 00 00 00 00 	movabs $0xffff800000000000,%rdx
   420aa:	80 ff ff 
   420ad:	48 01 c2             	add    %rax,%rdx
        if (va_is_canonical(va)) {
   420b0:	48 b9 ff ff ff ff ff 	movabs $0xfffeffffffffffff,%rcx
   420b7:	ff fe ff 
   420ba:	48 39 d1             	cmp    %rdx,%rcx
   420bd:	72 39                	jb     420f8 <vmiter::real_find(unsigned long)+0x8c>
            perm_ = initial_perm;
            pep_ = &pt_->entry[pageindex(va, level_)];
        } else {
            perm_ = 0;
   420bf:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%rdi)
   420c6:	ba a8 5f 04 00       	mov    $0x45fa8,%edx
   420cb:	eb 42                	jmp    4210f <vmiter::real_find(unsigned long)+0xa3>
            pep_ = const_cast<x86_64_pageentry_t*>(&zero_pe);
        }
    } else {
        int curidx = (reinterpret_cast<uintptr_t>(pep_) % PAGESIZE) >> 3;
   420cd:	4c 8b 47 08          	mov    0x8(%rdi),%r8
    return (int) (addr >> (PAGEOFFBITS + level * PAGEINDEXBITS)) & 0x1FF;
   420d1:	8d 4e 03             	lea    0x3(%rsi),%ecx
   420d4:	48 89 c2             	mov    %rax,%rdx
   420d7:	48 d3 ea             	shr    %cl,%rdx
   420da:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
   420e0:	4c 89 c1             	mov    %r8,%rcx
   420e3:	48 c1 e9 03          	shr    $0x3,%rcx
   420e7:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
        pep_ += pageindex(va, level_) - curidx;
   420ed:	29 ca                	sub    %ecx,%edx
   420ef:	48 63 d2             	movslq %edx,%rdx
   420f2:	49 8d 14 d0          	lea    (%r8,%rdx,8),%rdx
   420f6:	eb 17                	jmp    4210f <vmiter::real_find(unsigned long)+0xa3>
            perm_ = initial_perm;
   420f8:	c7 47 14 ff 0f 00 00 	movl   $0xfff,0x14(%rdi)
            pep_ = &pt_->entry[pageindex(va, level_)];
   420ff:	48 89 c2             	mov    %rax,%rdx
   42102:	48 c1 ea 24          	shr    $0x24,%rdx
   42106:	81 e2 f8 0f 00 00    	and    $0xff8,%edx
   4210c:	48 03 17             	add    (%rdi),%rdx
            pep_ = const_cast<x86_64_pageentry_t*>(&zero_pe);
   4210f:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    }
    va_ = va;
   42113:	48 89 47 18          	mov    %rax,0x18(%rdi)
    down();
   42117:	e8 b8 fe ff ff       	call   41fd4 <vmiter::down()>
}
   4211c:	5d                   	pop    %rbp
   4211d:	c3                   	ret

000000000004211e <vmiter::range_perm(unsigned long) const>:
uint64_t vmiter::range_perm(size_t sz) const {
   4211e:	f3 0f 1e fa          	endbr64
   42122:	55                   	push   %rbp
   42123:	48 89 e5             	mov    %rsp,%rbp
   42126:	41 55                	push   %r13
   42128:	41 54                	push   %r12
   4212a:	53                   	push   %rbx
   4212b:	48 83 ec 28          	sub    $0x28,%rsp
   4212f:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   42133:	48 63 47 14          	movslq 0x14(%rdi),%rax
   42137:	48 23 01             	and    (%rcx),%rax
    return ph & -(ph & PTE_P);
   4213a:	48 89 c3             	mov    %rax,%rbx
   4213d:	83 e3 01             	and    $0x1,%ebx
   42140:	48 f7 db             	neg    %rbx
   42143:	48 21 c3             	and    %rax,%rbx
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   42146:	8b 47 10             	mov    0x10(%rdi),%eax
   42149:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   4214d:	b8 01 00 00 00       	mov    $0x1,%eax
   42152:	48 d3 e0             	shl    %cl,%rax
    if ((p & PTE_P) != 0 && sz > rsz) {
   42155:	f6 c3 01             	test   $0x1,%bl
   42158:	74 08                	je     42162 <vmiter::range_perm(unsigned long) const+0x44>
   4215a:	48 89 fa             	mov    %rdi,%rdx
   4215d:	48 39 f0             	cmp    %rsi,%rax
   42160:	72 15                	jb     42177 <vmiter::range_perm(unsigned long) const+0x59>
        return p;
   42162:	48 89 d8             	mov    %rbx,%rax
   42165:	83 e0 01             	and    $0x1,%eax
   42168:	48 0f 45 c3          	cmovne %rbx,%rax
}
   4216c:	48 83 c4 28          	add    $0x28,%rsp
   42170:	5b                   	pop    %rbx
   42171:	41 5c                	pop    %r12
   42173:	41 5d                	pop    %r13
   42175:	5d                   	pop    %rbp
   42176:	c3                   	ret
    return va_;
   42177:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
        if (sz > ((int64_t) va() < 0 ? 0 : VA_LOWEND) - va()) {
   4217b:	48 89 f9             	mov    %rdi,%rcx
   4217e:	48 f7 d1             	not    %rcx
   42181:	48 c1 e9 3f          	shr    $0x3f,%rcx
   42185:	48 c1 e1 2f          	shl    $0x2f,%rcx
   42189:	48 29 f9             	sub    %rdi,%rcx
   4218c:	48 39 f1             	cmp    %rsi,%rcx
   4218f:	0f 82 8e 00 00 00    	jb     42223 <vmiter::range_perm(unsigned long) const+0x105>
        vmiter it(*this);
   42195:	48 8b 0a             	mov    (%rdx),%rcx
   42198:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
   4219c:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
   421a0:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
   421a4:	48 8b 4a 10          	mov    0x10(%rdx),%rcx
   421a8:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
   421ac:	48 8b 52 18          	mov    0x18(%rdx),%rdx
   421b0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
        sz += va() & (rsz - 1);
   421b4:	4c 8d 60 ff          	lea    -0x1(%rax),%r12
   421b8:	49 21 fc             	and    %rdi,%r12
   421bb:	49 01 f4             	add    %rsi,%r12
   421be:	41 bd 01 00 00 00    	mov    $0x1,%r13d
            sz -= rsz;
   421c4:	49 29 c4             	sub    %rax,%r12
   421c7:	8b 45 d0             	mov    -0x30(%rbp),%eax
   421ca:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   421ce:	4c 89 ee             	mov    %r13,%rsi
   421d1:	48 d3 e6             	shl    %cl,%rsi
   421d4:	48 83 ee 01          	sub    $0x1,%rsi
    return (va_ | pageoffmask(level_)) + 1;
   421d8:	48 0b 75 d8          	or     -0x28(%rbp),%rsi
   421dc:	48 83 c6 01          	add    $0x1,%rsi
    real_find(last_va());
   421e0:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   421e4:	e8 83 fe ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    uint64_t ph = *pep_ & perm_;
   421e9:	48 63 55 d4          	movslq -0x2c(%rbp),%rdx
   421ed:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   421f1:	48 23 10             	and    (%rax),%rdx
    return ph & -(ph & PTE_P);
   421f4:	48 89 d0             	mov    %rdx,%rax
   421f7:	83 e0 01             	and    $0x1,%eax
   421fa:	48 f7 d8             	neg    %rax
   421fd:	48 21 d0             	and    %rdx,%rax
            p &= it.perm();
   42200:	48 21 c3             	and    %rax,%rbx
   42203:	8b 45 d0             	mov    -0x30(%rbp),%eax
   42206:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   4220a:	4c 89 e8             	mov    %r13,%rax
   4220d:	48 d3 e0             	shl    %cl,%rax
        } while ((p & PTE_P) != 0 && sz > rsz);
   42210:	f6 c3 01             	test   $0x1,%bl
   42213:	0f 84 49 ff ff ff    	je     42162 <vmiter::range_perm(unsigned long) const+0x44>
   42219:	4c 39 e0             	cmp    %r12,%rax
   4221c:	72 a6                	jb     421c4 <vmiter::range_perm(unsigned long) const+0xa6>
   4221e:	e9 3f ff ff ff       	jmp    42162 <vmiter::range_perm(unsigned long) const+0x44>
            return 0;
   42223:	b8 00 00 00 00       	mov    $0x0,%eax
   42228:	e9 3f ff ff ff       	jmp    4216c <vmiter::range_perm(unsigned long) const+0x4e>
   4222d:	90                   	nop

000000000004222e <vmiter::next()>:

void vmiter::next() {
   4222e:	f3 0f 1e fa          	endbr64
   42232:	55                   	push   %rbp
   42233:	48 89 e5             	mov    %rsp,%rbp
    int level = 0;
    if (level_ > 0 && !perm()) {
   42236:	8b 47 10             	mov    0x10(%rdi),%eax
   42239:	85 c0                	test   %eax,%eax
   4223b:	7e 3e                	jle    4227b <vmiter::next()+0x4d>
    uint64_t ph = *pep_ & perm_;
   4223d:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
   42241:	48 63 57 14          	movslq 0x14(%rdi),%rdx
   42245:	48 23 11             	and    (%rcx),%rdx
    return ph & -(ph & PTE_P);
   42248:	48 89 d1             	mov    %rdx,%rcx
   4224b:	83 e1 01             	and    $0x1,%ecx
   4224e:	48 f7 d9             	neg    %rcx
    int level = 0;
   42251:	48 85 d1             	test   %rdx,%rcx
   42254:	ba 00 00 00 00       	mov    $0x0,%edx
   42259:	0f 45 c2             	cmovne %edx,%eax
   4225c:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   42260:	be 01 00 00 00       	mov    $0x1,%esi
   42265:	48 d3 e6             	shl    %cl,%rsi
   42268:	48 83 ee 01          	sub    $0x1,%rsi
        level = level_;
    }
    real_find((va_ | pageoffmask(level)) + 1);
   4226c:	48 0b 77 18          	or     0x18(%rdi),%rsi
   42270:	48 83 c6 01          	add    $0x1,%rsi
   42274:	e8 f3 fd ff ff       	call   4206c <vmiter::real_find(unsigned long)>
}
   42279:	5d                   	pop    %rbp
   4227a:	c3                   	ret
    int level = 0;
   4227b:	b8 00 00 00 00       	mov    $0x0,%eax
   42280:	eb da                	jmp    4225c <vmiter::next()+0x2e>

0000000000042282 <vmiter::try_map(unsigned long, int)>:

int vmiter::try_map(uintptr_t pa, int perm) {
   42282:	f3 0f 1e fa          	endbr64
   42286:	55                   	push   %rbp
   42287:	48 89 e5             	mov    %rsp,%rbp
   4228a:	41 57                	push   %r15
   4228c:	41 56                	push   %r14
   4228e:	41 55                	push   %r13
   42290:	41 54                	push   %r12
   42292:	53                   	push   %rbx
   42293:	48 83 ec 08          	sub    $0x8,%rsp
   42297:	49 89 fc             	mov    %rdi,%r12
   4229a:	49 89 f7             	mov    %rsi,%r15
   4229d:	41 89 d6             	mov    %edx,%r14d
    if (pa == (uintptr_t) -1 && perm == 0) {
   422a0:	48 83 fe ff          	cmp    $0xffffffffffffffff,%rsi
   422a4:	75 2a                	jne    422d0 <vmiter::try_map(unsigned long, int)+0x4e>
   422a6:	85 d2                	test   %edx,%edx
   422a8:	75 26                	jne    422d0 <vmiter::try_map(unsigned long, int)+0x4e>
        pa = 0;
    }
    // virtual address is page-aligned
    assert((va_ % PAGESIZE) == 0, "vmiter::try_map va not aligned");
   422aa:	4c 8b 7f 18          	mov    0x18(%rdi),%r15
   422ae:	41 81 e7 ff 0f 00 00 	and    $0xfff,%r15d
   422b5:	74 4a                	je     42301 <vmiter::try_map(unsigned long, int)+0x7f>
   422b7:	b9 60 5b 04 00       	mov    $0x45b60,%ecx
   422bc:	ba 6c 56 04 00       	mov    $0x4566c,%edx
   422c1:	be 49 00 00 00       	mov    $0x49,%esi
   422c6:	bf 82 56 04 00       	mov    $0x45682,%edi
   422cb:	e8 54 0b 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
   422d0:	66 41 f7 44 24 18 ff 	testw  $0xfff,0x18(%r12)
   422d7:	0f 
   422d8:	75 dd                	jne    422b7 <vmiter::try_map(unsigned long, int)+0x35>
    if (perm & PTE_P) {
   422da:	41 f6 c6 01          	test   $0x1,%r14b
   422de:	0f 84 ec 00 00 00    	je     423d0 <vmiter::try_map(unsigned long, int)+0x14e>
        // if mapping present, physical address is page-aligned
        assert(pa != (uintptr_t) -1, "vmiter::try_map mapping nonexistent pa");
   422e4:	49 83 ff ff          	cmp    $0xffffffffffffffff,%r15
   422e8:	0f 84 b0 00 00 00    	je     4239e <vmiter::try_map(unsigned long, int)+0x11c>
        assert((pa & PTE_PAMASK) == pa, "vmiter::try_map pa not aligned");
   422ee:	48 b8 ff 0f 00 00 00 	movabs $0xfff0000000000fff,%rax
   422f5:	00 f0 ff 
   422f8:	49 85 c7             	test   %rax,%r15
   422fb:	0f 85 b6 00 00 00    	jne    423b7 <vmiter::try_map(unsigned long, int)+0x135>
    } else {
        assert((pa & PTE_P) == 0, "vmiter::try_map invalid pa");
    }
    // new permissions (`perm`) cannot be less restrictive than permissions
    // imposed by higher-level page tables (`perm_`)
    assert(!(perm & ~perm_ & (PTE_P | PTE_W | PTE_U)));
   42301:	45 8b 6c 24 14       	mov    0x14(%r12),%r13d
   42306:	41 f7 d5             	not    %r13d
   42309:	45 21 f5             	and    %r14d,%r13d
   4230c:	41 83 e5 07          	and    $0x7,%r13d
   42310:	0f 85 dd 00 00 00    	jne    423f3 <vmiter::try_map(unsigned long, int)+0x171>

    while (level_ > 0 && perm) {
   42316:	41 8b 44 24 10       	mov    0x10(%r12),%eax
   4231b:	45 85 f6             	test   %r14d,%r14d
   4231e:	74 57                	je     42377 <vmiter::try_map(unsigned long, int)+0xf5>
   42320:	85 c0                	test   %eax,%eax
   42322:	7e 53                	jle    42377 <vmiter::try_map(unsigned long, int)+0xf5>
        assert(!(*pep_ & PTE_P));
   42324:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   42329:	f6 00 01             	testb  $0x1,(%rax)
   4232c:	0f 85 da 00 00 00    	jne    4240c <vmiter::try_map(unsigned long, int)+0x18a>
        x86_64_pagetable* pt = (x86_64_pagetable*) kalloc(PAGESIZE);
   42332:	bf 00 10 00 00       	mov    $0x1000,%edi
   42337:	e8 7d e8 ff ff       	call   40bb9 <kalloc(unsigned long)>
   4233c:	48 89 c3             	mov    %rax,%rbx
        if (!pt) {
   4233f:	48 85 c0             	test   %rax,%rax
   42342:	0f 84 dd 00 00 00    	je     42425 <vmiter::try_map(unsigned long, int)+0x1a3>
            return -1;
        }
        memset(pt, 0, PAGESIZE);
   42348:	ba 00 10 00 00       	mov    $0x1000,%edx
   4234d:	be 00 00 00 00       	mov    $0x0,%esi
   42352:	48 89 c7             	mov    %rax,%rdi
   42355:	e8 e6 24 00 00       	call   44840 <memset>
        *pep_ = (uintptr_t) pt | PTE_P | PTE_W | PTE_U;
   4235a:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   4235f:	48 83 cb 07          	or     $0x7,%rbx
   42363:	48 89 18             	mov    %rbx,(%rax)
        down();
   42366:	4c 89 e7             	mov    %r12,%rdi
   42369:	e8 66 fc ff ff       	call   41fd4 <vmiter::down()>
    while (level_ > 0 && perm) {
   4236e:	41 8b 44 24 10       	mov    0x10(%r12),%eax
   42373:	85 c0                	test   %eax,%eax
   42375:	7f ad                	jg     42324 <vmiter::try_map(unsigned long, int)+0xa2>
    }

    if (level_ == 0) {
   42377:	85 c0                	test   %eax,%eax
   42379:	75 11                	jne    4238c <vmiter::try_map(unsigned long, int)+0x10a>
        *pep_ = pa | perm;
   4237b:	49 8b 54 24 08       	mov    0x8(%r12),%rdx
   42380:	4d 63 f6             	movslq %r14d,%r14
   42383:	4d 09 fe             	or     %r15,%r14
   42386:	4c 89 32             	mov    %r14,(%rdx)
    }
    return 0;
   42389:	41 89 c5             	mov    %eax,%r13d
}
   4238c:	44 89 e8             	mov    %r13d,%eax
   4238f:	48 83 c4 08          	add    $0x8,%rsp
   42393:	5b                   	pop    %rbx
   42394:	41 5c                	pop    %r12
   42396:	41 5d                	pop    %r13
   42398:	41 5e                	pop    %r14
   4239a:	41 5f                	pop    %r15
   4239c:	5d                   	pop    %rbp
   4239d:	c3                   	ret
        assert(pa != (uintptr_t) -1, "vmiter::try_map mapping nonexistent pa");
   4239e:	b9 80 5b 04 00       	mov    $0x45b80,%ecx
   423a3:	ba 8e 56 04 00       	mov    $0x4568e,%edx
   423a8:	be 4c 00 00 00       	mov    $0x4c,%esi
   423ad:	bf 82 56 04 00       	mov    $0x45682,%edi
   423b2:	e8 6d 0a 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
        assert((pa & PTE_PAMASK) == pa, "vmiter::try_map pa not aligned");
   423b7:	b9 a8 5b 04 00       	mov    $0x45ba8,%ecx
   423bc:	ba a3 56 04 00       	mov    $0x456a3,%edx
   423c1:	be 4d 00 00 00       	mov    $0x4d,%esi
   423c6:	bf 82 56 04 00       	mov    $0x45682,%edi
   423cb:	e8 54 0a 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
        assert((pa & PTE_P) == 0, "vmiter::try_map invalid pa");
   423d0:	41 f6 c7 01          	test   $0x1,%r15b
   423d4:	0f 84 27 ff ff ff    	je     42301 <vmiter::try_map(unsigned long, int)+0x7f>
   423da:	b9 bb 56 04 00       	mov    $0x456bb,%ecx
   423df:	ba d6 56 04 00       	mov    $0x456d6,%edx
   423e4:	be 4f 00 00 00       	mov    $0x4f,%esi
   423e9:	bf 82 56 04 00       	mov    $0x45682,%edi
   423ee:	e8 31 0a 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
    assert(!(perm & ~perm_ & (PTE_P | PTE_W | PTE_U)));
   423f3:	b9 00 00 00 00       	mov    $0x0,%ecx
   423f8:	ba c8 5b 04 00       	mov    $0x45bc8,%edx
   423fd:	be 53 00 00 00       	mov    $0x53,%esi
   42402:	bf 82 56 04 00       	mov    $0x45682,%edi
   42407:	e8 18 0a 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
        assert(!(*pep_ & PTE_P));
   4240c:	b9 00 00 00 00       	mov    $0x0,%ecx
   42411:	ba e8 56 04 00       	mov    $0x456e8,%edx
   42416:	be 56 00 00 00       	mov    $0x56,%esi
   4241b:	bf 82 56 04 00       	mov    $0x45682,%edi
   42420:	e8 ff 09 00 00       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
            return -1;
   42425:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   4242b:	e9 5c ff ff ff       	jmp    4238c <vmiter::try_map(unsigned long, int)+0x10a>

0000000000042430 <ptiter::down(bool)>:
ptiter::ptiter(x86_64_pagetable* pt)
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), va_(0) {
    down(false);
}

void ptiter::down(bool skip) {
   42430:	f3 0f 1e fa          	endbr64
   42434:	55                   	push   %rbp
   42435:	48 89 e5             	mov    %rsp,%rbp
   42438:	41 55                	push   %r13
   4243a:	41 54                	push   %r12
   4243c:	53                   	push   %rbx
    int stop_level = 1;
   4243d:	41 ba 01 00 00 00    	mov    $0x1,%r10d
   42443:	41 b8 01 00 00 00    	mov    $0x1,%r8d
        if ((*pep_ & (PTE_P | PTE_PS)) == PTE_P && !skip) {
            if (level_ == stop_level) {
                break;
            } else {
                --level_;
                uintptr_t pa = *pep_ & PTE_PAMASK;
   42449:	49 bb 00 f0 ff ff ff 	movabs $0xffffffffff000,%r11
   42450:	ff 0f 00 
void ptiter::down(bool skip) {
   42453:	41 b9 00 00 00 00    	mov    $0x0,%r9d
   42459:	eb 53                	jmp    424ae <ptiter::down(bool)+0x7e>
            if (level_ == stop_level) {
   4245b:	8b 47 10             	mov    0x10(%rdi),%eax
   4245e:	44 39 d0             	cmp    %r10d,%eax
   42461:	74 35                	je     42498 <ptiter::down(bool)+0x68>
                --level_;
   42463:	83 e8 01             	sub    $0x1,%eax
   42466:	89 47 10             	mov    %eax,0x10(%rdi)
                uintptr_t pa = *pep_ & PTE_PAMASK;
   42469:	4c 89 da             	mov    %r11,%rdx
   4246c:	49 23 14 24          	and    (%r12),%rdx
    return (int) (addr >> (PAGEOFFBITS + level * PAGEINDEXBITS)) & 0x1FF;
   42470:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   42474:	48 8b 47 18          	mov    0x18(%rdi),%rax
   42478:	48 d3 e8             	shr    %cl,%rax
                x86_64_pagetable* pt = reinterpret_cast<x86_64_pagetable*>(pa);
                pep_ = &pt->entry[pageindex(va_, level_)];
   4247b:	25 ff 01 00 00       	and    $0x1ff,%eax
   42480:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
   42484:	48 89 47 08          	mov    %rax,0x8(%rdi)
            }
        } else {
   42488:	eb 21                	jmp    424ab <ptiter::down(bool)+0x7b>
            uintptr_t va = (va_ | pageoffmask(level_)) + 1;
            if ((va ^ va_) & ~pageoffmask(level_ + 1)) {
                // up one level
                if (level_ == 3) {
                    va_ = VA_NONCANONMAX + 1;
   4248a:	48 b8 00 00 00 00 00 	movabs $0x1000000000000,%rax
   42491:	00 01 00 
   42494:	48 89 47 18          	mov    %rax,0x18(%rdi)
                va_ = va;
            }
            skip = false;
        }
    }
}
   42498:	5b                   	pop    %rbx
   42499:	41 5c                	pop    %r12
   4249b:	41 5d                	pop    %r13
   4249d:	5d                   	pop    %rbp
   4249e:	c3                   	ret
                ++pep_;
   4249f:	49 83 c4 08          	add    $0x8,%r12
   424a3:	4c 89 67 08          	mov    %r12,0x8(%rdi)
                va_ = va;
   424a7:	48 89 47 18          	mov    %rax,0x18(%rdi)
void ptiter::down(bool skip) {
   424ab:	44 89 ce             	mov    %r9d,%esi
        if ((*pep_ & (PTE_P | PTE_PS)) == PTE_P && !skip) {
   424ae:	4c 8b 67 08          	mov    0x8(%rdi),%r12
   424b2:	49 8b 04 24          	mov    (%r12),%rax
   424b6:	25 81 00 00 00       	and    $0x81,%eax
   424bb:	48 83 f8 01          	cmp    $0x1,%rax
   424bf:	75 05                	jne    424c6 <ptiter::down(bool)+0x96>
   424c1:	40 84 f6             	test   %sil,%sil
   424c4:	74 95                	je     4245b <ptiter::down(bool)+0x2b>
            uintptr_t va = (va_ | pageoffmask(level_)) + 1;
   424c6:	48 8b 77 18          	mov    0x18(%rdi),%rsi
   424ca:	44 8b 6f 10          	mov    0x10(%rdi),%r13d
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   424ce:	43 8d 5c ed 00       	lea    0x0(%r13,%r13,8),%ebx
   424d3:	8d 4b 0c             	lea    0xc(%rbx),%ecx
   424d6:	4c 89 c2             	mov    %r8,%rdx
   424d9:	48 d3 e2             	shl    %cl,%rdx
   424dc:	48 83 ea 01          	sub    $0x1,%rdx
   424e0:	48 09 f2             	or     %rsi,%rdx
   424e3:	48 8d 42 01          	lea    0x1(%rdx),%rax
   424e7:	8d 4b 15             	lea    0x15(%rbx),%ecx
   424ea:	4c 89 c2             	mov    %r8,%rdx
   424ed:	48 d3 e2             	shl    %cl,%rdx
            if ((va ^ va_) & ~pageoffmask(level_ + 1)) {
   424f0:	48 f7 da             	neg    %rdx
   424f3:	48 89 f1             	mov    %rsi,%rcx
   424f6:	48 31 c1             	xor    %rax,%rcx
   424f9:	48 85 ca             	test   %rcx,%rdx
   424fc:	74 a1                	je     4249f <ptiter::down(bool)+0x6f>
                if (level_ == 3) {
   424fe:	41 83 fd 03          	cmp    $0x3,%r13d
   42502:	74 86                	je     4248a <ptiter::down(bool)+0x5a>
            if ((va ^ va_) & ~pageoffmask(level_ + 1)) {
   42504:	45 8d 55 01          	lea    0x1(%r13),%r10d
                level_ = 3;
   42508:	c7 47 10 03 00 00 00 	movl   $0x3,0x10(%rdi)
                pep_ = &pt_->entry[pageindex(va_, level_)];
   4250f:	48 89 f0             	mov    %rsi,%rax
   42512:	48 c1 e8 24          	shr    $0x24,%rax
   42516:	25 f8 0f 00 00       	and    $0xff8,%eax
   4251b:	48 03 07             	add    (%rdi),%rax
   4251e:	48 89 47 08          	mov    %rax,0x8(%rdi)
   42522:	eb 87                	jmp    424ab <ptiter::down(bool)+0x7b>

0000000000042524 <ptiter::ptiter(x86_64_pagetable*)>:
ptiter::ptiter(x86_64_pagetable* pt)
   42524:	f3 0f 1e fa          	endbr64
   42528:	55                   	push   %rbp
   42529:	48 89 e5             	mov    %rsp,%rbp
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), va_(0) {
   4252c:	48 89 37             	mov    %rsi,(%rdi)
   4252f:	48 89 77 08          	mov    %rsi,0x8(%rdi)
   42533:	c7 47 10 03 00 00 00 	movl   $0x3,0x10(%rdi)
   4253a:	48 c7 47 18 00 00 00 	movq   $0x0,0x18(%rdi)
   42541:	00 
    down(false);
   42542:	be 00 00 00 00       	mov    $0x0,%esi
   42547:	e8 e4 fe ff ff       	call   42430 <ptiter::down(bool)>
}
   4254c:	5d                   	pop    %rbp
   4254d:	c3                   	ret

000000000004254e <(anonymous namespace)::log_printer::putc(unsigned char, int)>:
         | IO_PARALLEL_CONTROL_INIT);
}

namespace {
struct log_printer : public printer {
    void putc(unsigned char c, int) override {
   4254e:	f3 0f 1e fa          	endbr64
   42552:	41 89 f0             	mov    %esi,%r8d
    if (!initialized) {
   42555:	83 3d a8 da 01 00 00 	cmpl   $0x0,0x1daa8(%rip)        # 60004 <parallel_port_putc(unsigned char)::initialized>
   4255c:	75 15                	jne    42573 <(anonymous namespace)::log_printer::putc(unsigned char, int)+0x25>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
   4255e:	b8 00 00 00 00       	mov    $0x0,%eax
   42563:	ba 7a 03 00 00       	mov    $0x37a,%edx
   42568:	ee                   	out    %al,(%dx)
        initialized = 1;
   42569:	c7 05 91 da 01 00 01 	movl   $0x1,0x1da91(%rip)        # 60004 <parallel_port_putc(unsigned char)::initialized>
   42570:	00 00 00 
    asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
   42573:	ba 79 03 00 00       	mov    $0x379,%edx
   42578:	ec                   	in     (%dx),%al
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   42579:	be 00 32 00 00       	mov    $0x3200,%esi
   4257e:	b9 84 00 00 00       	mov    $0x84,%ecx
   42583:	bf 79 03 00 00       	mov    $0x379,%edi
   42588:	84 c0                	test   %al,%al
   4258a:	78 12                	js     4259e <(anonymous namespace)::log_printer::putc(unsigned char, int)+0x50>
   4258c:	89 ca                	mov    %ecx,%edx
   4258e:	ec                   	in     (%dx),%al
   4258f:	ec                   	in     (%dx),%al
   42590:	ec                   	in     (%dx),%al
   42591:	ec                   	in     (%dx),%al
   42592:	83 ee 01             	sub    $0x1,%esi
   42595:	74 07                	je     4259e <(anonymous namespace)::log_printer::putc(unsigned char, int)+0x50>
   42597:	89 fa                	mov    %edi,%edx
   42599:	ec                   	in     (%dx),%al
   4259a:	84 c0                	test   %al,%al
   4259c:	79 ee                	jns    4258c <(anonymous namespace)::log_printer::putc(unsigned char, int)+0x3e>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
   4259e:	ba 78 03 00 00       	mov    $0x378,%edx
   425a3:	44 89 c0             	mov    %r8d,%eax
   425a6:	ee                   	out    %al,(%dx)
   425a7:	ba 7a 03 00 00       	mov    $0x37a,%edx
   425ac:	b8 0d 00 00 00       	mov    $0xd,%eax
   425b1:	ee                   	out    %al,(%dx)
   425b2:	b8 0c 00 00 00       	mov    $0xc,%eax
   425b7:	ee                   	out    %al,(%dx)
        parallel_port_putc(c);
    }
   425b8:	c3                   	ret

00000000000425b9 <stash_kernel_data(bool)>:

// stash_kernel_data
//    Soft reboot requires that we restore kernel data memory to
//    its initial state, so we store its initial state in unused
//    physical memory.
static void stash_kernel_data(bool reboot) {
   425b9:	55                   	push   %rbp
   425ba:	48 89 e5             	mov    %rsp,%rbp
   425bd:	89 f8                	mov    %edi,%eax
    // stash initial value of data segment for soft-reboot support
    extern uint8_t _data_start[], _edata[], _kernel_end[];
    uintptr_t data_size = (uintptr_t) _edata - (uintptr_t) _data_start;
   425bf:	ba a0 81 05 00       	mov    $0x581a0,%edx
   425c4:	48 81 ea 00 70 04 00 	sub    $0x47000,%rdx
    uint8_t* data_stash = (uint8_t*) (SYMTAB_ADDR - data_size);
   425cb:	bf 00 70 04 01       	mov    $0x1047000,%edi
   425d0:	48 81 ef a0 81 05 00 	sub    $0x581a0,%rdi
    if (reboot) {
   425d7:	84 c0                	test   %al,%al
   425d9:	74 2a                	je     42605 <stash_kernel_data(bool)+0x4c>
        memcpy(_data_start, data_stash, data_size);
   425db:	48 89 fe             	mov    %rdi,%rsi
   425de:	bf 00 70 04 00       	mov    $0x47000,%edi
   425e3:	e8 34 22 00 00       	call   4481c <memcpy>
        memset(_edata, 0, _kernel_end - _edata);
   425e8:	ba b0 01 06 00       	mov    $0x601b0,%edx
   425ed:	48 81 ea a0 81 05 00 	sub    $0x581a0,%rdx
   425f4:	be 00 00 00 00       	mov    $0x0,%esi
   425f9:	bf a0 81 05 00       	mov    $0x581a0,%edi
   425fe:	e8 3d 22 00 00       	call   44840 <memset>
    } else {
        memcpy(data_stash, _data_start, data_size);
    }
}
   42603:	5d                   	pop    %rbp
   42604:	c3                   	ret
        memcpy(data_stash, _data_start, data_size);
   42605:	be 00 70 04 00       	mov    $0x47000,%esi
   4260a:	e8 0d 22 00 00       	call   4481c <memcpy>
}
   4260f:	eb f2                	jmp    42603 <stash_kernel_data(bool)+0x4a>

0000000000042611 <init_timer(int)>:
void init_timer(int rate) {
   42611:	f3 0f 1e fa          	endbr64
    if (rate > 0) {
   42615:	85 ff                	test   %edi,%edi
   42617:	7e 16                	jle    4262f <init_timer(int)+0x1e>
        lapic.write(lapic.reg_timer_initial_count, 1000000000 / rate);
   42619:	b8 00 ca 9a 3b       	mov    $0x3b9aca00,%eax
   4261e:	ba 00 00 00 00       	mov    $0x0,%edx
   42623:	f7 ff                	idiv   %edi
   42625:	a3 80 03 e0 fe 00 00 	movabs %eax,0xfee00380
   4262c:	00 00 
}
   4262e:	c3                   	ret
    reg_[reg].v = v;
   4262f:	b8 80 03 e0 fe       	mov    $0xfee00380,%eax
   42634:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
}
   4263a:	c3                   	ret

000000000004263b <reserved_physical_address(unsigned long)>:
bool reserved_physical_address(uintptr_t pa) {
   4263b:	f3 0f 1e fa          	endbr64
    return pa < PAGESIZE || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   4263f:	48 8d 87 00 00 f6 ff 	lea    -0xa0000(%rdi),%rax
   42646:	48 3d ff ff 05 00    	cmp    $0x5ffff,%rax
   4264c:	0f 96 c0             	setbe  %al
   4264f:	48 81 ff ff 0f 00 00 	cmp    $0xfff,%rdi
   42656:	0f 96 c2             	setbe  %dl
   42659:	09 d0                	or     %edx,%eax
}
   4265b:	c3                   	ret

000000000004265c <allocatable_physical_address(unsigned long)>:
bool allocatable_physical_address(uintptr_t pa) {
   4265c:	f3 0f 1e fa          	endbr64
   42660:	55                   	push   %rbp
   42661:	48 89 e5             	mov    %rsp,%rbp
   42664:	53                   	push   %rbx
   42665:	48 83 ec 08          	sub    $0x8,%rsp
   42669:	48 89 fb             	mov    %rdi,%rbx
    return !reserved_physical_address(pa)
   4266c:	e8 ca ff ff ff       	call   4263b <reserved_physical_address(unsigned long)>
        && pa < MEMSIZE_PHYSICAL;
   42671:	84 c0                	test   %al,%al
   42673:	75 36                	jne    426ab <allocatable_physical_address(unsigned long)+0x4f>
        && (pa < KERNEL_START_ADDR
   42675:	48 81 fb ff ff 03 00 	cmp    $0x3ffff,%rbx
   4267c:	76 21                	jbe    4269f <allocatable_physical_address(unsigned long)+0x43>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
   4267e:	ba af 11 06 00       	mov    $0x611af,%edx
            || pa >= round_up((uintptr_t) _kernel_end, PAGESIZE))
   42683:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
   4268a:	48 39 d3             	cmp    %rdx,%rbx
   4268d:	72 21                	jb     426b0 <allocatable_physical_address(unsigned long)+0x54>
            || pa >= KERNEL_STACK_TOP)
   4268f:	48 8d 93 00 10 f8 ff 	lea    -0x7f000(%rbx),%rdx
        && (pa < KERNEL_STACK_TOP - PAGESIZE
   42696:	48 81 fa ff 0f 00 00 	cmp    $0xfff,%rdx
   4269d:	76 11                	jbe    426b0 <allocatable_physical_address(unsigned long)+0x54>
        && pa < MEMSIZE_PHYSICAL;
   4269f:	48 81 fb ff ff 1f 00 	cmp    $0x1fffff,%rbx
   426a6:	0f 96 c0             	setbe  %al
   426a9:	eb 05                	jmp    426b0 <allocatable_physical_address(unsigned long)+0x54>
   426ab:	b8 00 00 00 00       	mov    $0x0,%eax
}
   426b0:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   426b4:	c9                   	leave
   426b5:	c3                   	ret

00000000000426b6 <init_process(proc*, int)>:
void init_process(proc* p, int flags) {
   426b6:	f3 0f 1e fa          	endbr64
   426ba:	55                   	push   %rbp
   426bb:	48 89 e5             	mov    %rsp,%rbp
   426be:	41 54                	push   %r12
   426c0:	53                   	push   %rbx
   426c1:	48 89 fb             	mov    %rdi,%rbx
   426c4:	41 89 f4             	mov    %esi,%r12d
    memset(&p->regs, 0, sizeof(p->regs));
   426c7:	48 8d 7f 10          	lea    0x10(%rdi),%rdi
   426cb:	ba c0 00 00 00       	mov    $0xc0,%edx
   426d0:	be 00 00 00 00       	mov    $0x0,%esi
   426d5:	e8 66 21 00 00       	call   44840 <memset>
    p->regs.reg_cs = SEGSEL_APP_CODE | 3;
   426da:	48 c7 83 b0 00 00 00 	movq   $0x1b,0xb0(%rbx)
   426e1:	1b 00 00 00 
    p->regs.reg_fs = SEGSEL_APP_DATA | 3;
   426e5:	48 c7 83 88 00 00 00 	movq   $0x23,0x88(%rbx)
   426ec:	23 00 00 00 
    p->regs.reg_gs = SEGSEL_APP_DATA | 3;
   426f0:	48 c7 83 90 00 00 00 	movq   $0x23,0x90(%rbx)
   426f7:	23 00 00 00 
    p->regs.reg_ss = SEGSEL_APP_DATA | 3;
   426fb:	48 c7 83 c8 00 00 00 	movq   $0x23,0xc8(%rbx)
   42702:	23 00 00 00 
    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   42706:	44 89 e0             	mov    %r12d,%eax
   42709:	83 e0 01             	and    $0x1,%eax
        p->regs.reg_rflags |= EFLAGS_IOPL_3;
   4270c:	83 f8 01             	cmp    $0x1,%eax
   4270f:	48 19 c0             	sbb    %rax,%rax
   42712:	48 25 00 d0 ff ff    	and    $0xffffffffffffd000,%rax
   42718:	48 05 00 32 00 00    	add    $0x3200,%rax
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   4271e:	41 f6 c4 02          	test   $0x2,%r12b
   42722:	75 09                	jne    4272d <init_process(proc*, int)+0x77>
   42724:	48 89 83 b8 00 00 00 	mov    %rax,0xb8(%rbx)
   4272b:	eb 0a                	jmp    42737 <init_process(proc*, int)+0x81>
        p->regs.reg_rflags &= ~EFLAGS_IF;
   4272d:	80 e4 fd             	and    $0xfd,%ah
   42730:	48 89 83 b8 00 00 00 	mov    %rax,0xb8(%rbx)
}
   42737:	5b                   	pop    %rbx
   42738:	41 5c                	pop    %r12
   4273a:	5d                   	pop    %rbp
   4273b:	c3                   	ret

000000000004273c <console_show_cursor(int)>:
void console_show_cursor(int cpos) {
   4273c:	f3 0f 1e fa          	endbr64
        cpos = 0;
   42740:	81 ff d1 07 00 00    	cmp    $0x7d1,%edi
   42746:	b8 00 00 00 00       	mov    $0x0,%eax
   4274b:	0f 43 f8             	cmovae %eax,%edi
   4274e:	be d4 03 00 00       	mov    $0x3d4,%esi
   42753:	b8 0e 00 00 00       	mov    $0xe,%eax
   42758:	89 f2                	mov    %esi,%edx
   4275a:	ee                   	out    %al,(%dx)
    outb(0x3D5, cpos / 256);
   4275b:	8d 87 ff 00 00 00    	lea    0xff(%rdi),%eax
   42761:	85 ff                	test   %edi,%edi
   42763:	0f 49 c7             	cmovns %edi,%eax
   42766:	c1 f8 08             	sar    $0x8,%eax
   42769:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
   4276e:	89 ca                	mov    %ecx,%edx
   42770:	ee                   	out    %al,(%dx)
   42771:	b8 0f 00 00 00       	mov    $0xf,%eax
   42776:	89 f2                	mov    %esi,%edx
   42778:	ee                   	out    %al,(%dx)
    outb(0x3D5, cpos % 256);
   42779:	89 fa                	mov    %edi,%edx
   4277b:	c1 fa 1f             	sar    $0x1f,%edx
   4277e:	c1 ea 18             	shr    $0x18,%edx
   42781:	8d 04 17             	lea    (%rdi,%rdx,1),%eax
   42784:	0f b6 c0             	movzbl %al,%eax
   42787:	29 d0                	sub    %edx,%eax
   42789:	89 ca                	mov    %ecx,%edx
   4278b:	ee                   	out    %al,(%dx)
}
   4278c:	c3                   	ret

000000000004278d <keyboard_readc()>:
int keyboard_readc() {
   4278d:	f3 0f 1e fa          	endbr64
    asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
   42791:	ba 64 00 00 00       	mov    $0x64,%edx
   42796:	ec                   	in     (%dx),%al
    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   42797:	a8 01                	test   $0x1,%al
   42799:	0f 84 1d 01 00 00    	je     428bc <keyboard_readc()+0x12f>
   4279f:	ba 60 00 00 00       	mov    $0x60,%edx
   427a4:	ec                   	in     (%dx),%al
    uint8_t escape = last_escape;
   427a5:	0f b6 15 5c d8 01 00 	movzbl 0x1d85c(%rip),%edx        # 60008 <keyboard_readc()::last_escape>
    last_escape = 0;
   427ac:	c6 05 55 d8 01 00 00 	movb   $0x0,0x1d855(%rip)        # 60008 <keyboard_readc()::last_escape>
    if (data == 0xE0) {         // mode shift
   427b3:	3c e0                	cmp    $0xe0,%al
   427b5:	74 2a                	je     427e1 <keyboard_readc()+0x54>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   427b7:	84 c0                	test   %al,%al
   427b9:	78 33                	js     427ee <keyboard_readc()+0x61>
    int ch = (unsigned char) keymap[data | escape];
   427bb:	09 c2                	or     %eax,%edx
   427bd:	0f b6 d2             	movzbl %dl,%edx
   427c0:	0f b6 82 40 60 04 00 	movzbl 0x46040(%rdx),%eax
    if (ch >= 'a' && ch <= 'z') {
   427c7:	89 c1                	mov    %eax,%ecx
   427c9:	8d 50 9f             	lea    -0x61(%rax),%edx
   427cc:	83 fa 19             	cmp    $0x19,%edx
   427cf:	77 76                	ja     42847 <keyboard_readc()+0xba>
        if (modifiers & MOD_CONTROL) {
   427d1:	0f b6 15 31 d8 01 00 	movzbl 0x1d831(%rip),%edx        # 60009 <keyboard_readc()::modifiers>
   427d8:	f6 c2 02             	test   $0x2,%dl
   427db:	74 50                	je     4282d <keyboard_readc()+0xa0>
            ch -= 0x60;
   427dd:	83 e8 60             	sub    $0x60,%eax
   427e0:	c3                   	ret
        last_escape = 0x80;
   427e1:	c6 05 20 d8 01 00 80 	movb   $0x80,0x1d820(%rip)        # 60008 <keyboard_readc()::last_escape>
        return 0;
   427e8:	b8 00 00 00 00       	mov    $0x0,%eax
   427ed:	c3                   	ret
        int ch = keymap[(data & 0x7F) | escape];
   427ee:	83 e0 7f             	and    $0x7f,%eax
   427f1:	09 d0                	or     %edx,%eax
   427f3:	0f b6 c0             	movzbl %al,%eax
   427f6:	0f b6 88 40 60 04 00 	movzbl 0x46040(%rax),%ecx
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   427fd:	0f b6 d1             	movzbl %cl,%edx
   42800:	81 ea fa 00 00 00    	sub    $0xfa,%edx
        return 0;
   42806:	b8 00 00 00 00       	mov    $0x0,%eax
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   4280b:	83 fa 02             	cmp    $0x2,%edx
   4280e:	0f 87 ad 00 00 00    	ja     428c1 <keyboard_readc()+0x134>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   42814:	83 c1 06             	add    $0x6,%ecx
   42817:	0f b6 05 eb d7 01 00 	movzbl 0x1d7eb(%rip),%eax        # 60009 <keyboard_readc()::modifiers>
   4281e:	0f b3 c8             	btr    %ecx,%eax
   42821:	88 05 e2 d7 01 00    	mov    %al,0x1d7e2(%rip)        # 60009 <keyboard_readc()::modifiers>
        return 0;
   42827:	b8 00 00 00 00       	mov    $0x0,%eax
   4282c:	c3                   	ret
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   4282d:	89 d1                	mov    %edx,%ecx
   4282f:	83 f1 01             	xor    $0x1,%ecx
   42832:	83 e1 01             	and    $0x1,%ecx
   42835:	c0 ea 03             	shr    $0x3,%dl
   42838:	83 f2 01             	xor    $0x1,%edx
   4283b:	83 e2 01             	and    $0x1,%edx
            ch -= 0x20;
   4283e:	8d 70 e0             	lea    -0x20(%rax),%esi
   42841:	38 d1                	cmp    %dl,%cl
   42843:	0f 45 c6             	cmovne %esi,%eax
   42846:	c3                   	ret
    } else if (ch >= KEY_CAPSLOCK) {
   42847:	3d fc 00 00 00       	cmp    $0xfc,%eax
   4284c:	7e 19                	jle    42867 <keyboard_readc()+0xda>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   4284e:	8d 88 06 ff ff ff    	lea    -0xfa(%rax),%ecx
   42854:	ba 01 00 00 00       	mov    $0x1,%edx
   42859:	d3 e2                	shl    %cl,%edx
   4285b:	30 15 a8 d7 01 00    	xor    %dl,0x1d7a8(%rip)        # 60009 <keyboard_readc()::modifiers>
        ch = 0;
   42861:	b8 00 00 00 00       	mov    $0x0,%eax
   42866:	c3                   	ret
    } else if (ch >= KEY_SHIFT) {
   42867:	3d f9 00 00 00       	cmp    $0xf9,%eax
   4286c:	7e 19                	jle    42887 <keyboard_readc()+0xfa>
        modifiers |= 1 << (ch - KEY_SHIFT);
   4286e:	8d 88 06 ff ff ff    	lea    -0xfa(%rax),%ecx
   42874:	ba 01 00 00 00       	mov    $0x1,%edx
   42879:	d3 e2                	shl    %cl,%edx
   4287b:	08 15 88 d7 01 00    	or     %dl,0x1d788(%rip)        # 60009 <keyboard_readc()::modifiers>
        ch = 0;
   42881:	b8 00 00 00 00       	mov    $0x0,%eax
   42886:	c3                   	ret
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   42887:	83 c1 80             	add    $0xffffff80,%ecx
   4288a:	83 f9 15             	cmp    $0x15,%ecx
   4288d:	77 18                	ja     428a7 <keyboard_readc()+0x11a>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   4288f:	0f b6 15 73 d7 01 00 	movzbl 0x1d773(%rip),%edx        # 60009 <keyboard_readc()::modifiers>
   42896:	83 e2 03             	and    $0x3,%edx
   42899:	83 c0 80             	add    $0xffffff80,%eax
   4289c:	48 98                	cltq
   4289e:	0f b6 84 82 e0 5f 04 	movzbl 0x45fe0(%rdx,%rax,4),%eax
   428a5:	00 
   428a6:	c3                   	ret
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   428a7:	83 f8 7f             	cmp    $0x7f,%eax
   428aa:	7f 15                	jg     428c1 <keyboard_readc()+0x134>
        ch = 0;
   428ac:	f6 05 56 d7 01 00 02 	testb  $0x2,0x1d756(%rip)        # 60009 <keyboard_readc()::modifiers>
   428b3:	ba 00 00 00 00       	mov    $0x0,%edx
   428b8:	0f 45 c2             	cmovne %edx,%eax
   428bb:	c3                   	ret
        return -1;
   428bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   428c1:	c3                   	ret

00000000000428c2 <log_vprintf(char const*, __va_list_tag*)>:
void log_vprintf(const char* format, va_list val) {
   428c2:	f3 0f 1e fa          	endbr64
   428c6:	55                   	push   %rbp
   428c7:	48 89 e5             	mov    %rsp,%rbp
   428ca:	48 83 ec 10          	sub    $0x10,%rsp
   428ce:	48 89 fa             	mov    %rdi,%rdx
   428d1:	48 89 f1             	mov    %rsi,%rcx
    log_printer p;
   428d4:	48 c7 45 f8 d0 5f 04 	movq   $0x45fd0,-0x8(%rbp)
   428db:	00 
    p.vprintf(0, format, val);
   428dc:	be 00 00 00 00       	mov    $0x0,%esi
   428e1:	48 8d 7d f8          	lea    -0x8(%rbp),%rdi
   428e5:	e8 8a 20 00 00       	call   44974 <printer::vprintf(int, char const*, __va_list_tag*)>
}
   428ea:	c9                   	leave
   428eb:	c3                   	ret

00000000000428ec <log_printf(char const*, ...)>:
void log_printf(const char* format, ...) {
   428ec:	f3 0f 1e fa          	endbr64
   428f0:	55                   	push   %rbp
   428f1:	48 89 e5             	mov    %rsp,%rbp
   428f4:	48 83 ec 50          	sub    $0x50,%rsp
   428f8:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   428fc:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42900:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42904:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42908:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   4290c:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   42913:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42917:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   4291b:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4291f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   42923:	48 8d 75 b8          	lea    -0x48(%rbp),%rsi
   42927:	e8 96 ff ff ff       	call   428c2 <log_vprintf(char const*, __va_list_tag*)>
}
   4292c:	c9                   	leave
   4292d:	c3                   	ret

000000000004292e <lookup_symbol(unsigned long, char const**, unsigned long*)>:
bool lookup_symbol(uintptr_t addr, const char** name, uintptr_t* start) {
   4292e:	f3 0f 1e fa          	endbr64
   42932:	55                   	push   %rbp
   42933:	48 89 e5             	mov    %rsp,%rbp
   42936:	41 54                	push   %r12
   42938:	53                   	push   %rbx
   42939:	49 89 f8             	mov    %rdi,%r8
   4293c:	48 89 f3             	mov    %rsi,%rbx
   4293f:	49 89 d4             	mov    %rdx,%r12
    if (!kernel_pagetable[2].entry[SYMTAB_ADDR / 0x200000]) {
   42942:	48 83 3d f6 a6 01 00 	cmpq   $0x0,0x1a6f6(%rip)        # 5d040 <kernel_pagetable+0x2040>
   42949:	00 
   4294a:	75 0b                	jne    42957 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x29>
        kernel_pagetable[2].entry[SYMTAB_ADDR / 0x200000] =
   4294c:	48 c7 05 e9 a6 01 00 	movq   $0x1000083,0x1a6e9(%rip)        # 5d040 <kernel_pagetable+0x2040>
   42953:	83 00 00 01 
    size_t r = symtab.nsym;
   42957:	4c 8b 1d 4a 47 00 00 	mov    0x474a(%rip),%r11        # 470a8 <symtab+0x8>
        auto& sym = symtab.sym[m];
   4295e:	4c 8b 15 3b 47 00 00 	mov    0x473b(%rip),%r10        # 470a0 <symtab>
    size_t r = symtab.nsym;
   42965:	4c 89 d9             	mov    %r11,%rcx
    size_t l = 0;
   42968:	ba 00 00 00 00       	mov    $0x0,%edx
    while (l < r) {
   4296d:	eb 25                	jmp    42994 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x66>
                ? addr < sym.st_value + 0x1000
   4296f:	4c 8d 8e 00 10 00 00 	lea    0x1000(%rsi),%r9
            && (m + 1 == symtab.nsym
   42976:	4d 39 c8             	cmp    %r9,%r8
   42979:	73 11                	jae    4298c <lookup_symbol(unsigned long, char const**, unsigned long*)+0x5e>
            && (sym.st_size == 0 || addr <= sym.st_value + sym.st_size)) {
   4297b:	4c 8b 4f 10          	mov    0x10(%rdi),%r9
   4297f:	4d 85 c9             	test   %r9,%r9
   42982:	74 43                	je     429c7 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x99>
   42984:	49 01 f1             	add    %rsi,%r9
   42987:	4d 39 c1             	cmp    %r8,%r9
   4298a:	73 3b                	jae    429c7 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x99>
        } else if (sym.st_value < addr) {
   4298c:	4c 39 c6             	cmp    %r8,%rsi
   4298f:	72 6a                	jb     429fb <lookup_symbol(unsigned long, char const**, unsigned long*)+0xcd>
    size_t l = 0;
   42991:	48 89 c1             	mov    %rax,%rcx
    while (l < r) {
   42994:	48 39 ca             	cmp    %rcx,%rdx
   42997:	73 68                	jae    42a01 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xd3>
        size_t m = l + ((r - l) >> 1);
   42999:	48 89 c8             	mov    %rcx,%rax
   4299c:	48 29 d0             	sub    %rdx,%rax
   4299f:	48 d1 e8             	shr    $1,%rax
   429a2:	48 01 d0             	add    %rdx,%rax
        auto& sym = symtab.sym[m];
   429a5:	48 8d 34 40          	lea    (%rax,%rax,2),%rsi
   429a9:	49 8d 3c f2          	lea    (%r10,%rsi,8),%rdi
        if (sym.st_value <= addr
   429ad:	48 8b 77 08          	mov    0x8(%rdi),%rsi
   429b1:	49 39 f0             	cmp    %rsi,%r8
   429b4:	72 db                	jb     42991 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x63>
            && (m + 1 == symtab.nsym
   429b6:	4c 8d 48 01          	lea    0x1(%rax),%r9
        if (sym.st_value <= addr
   429ba:	4d 39 d9             	cmp    %r11,%r9
   429bd:	74 b0                	je     4296f <lookup_symbol(unsigned long, char const**, unsigned long*)+0x41>
                ? addr < sym.st_value + 0x1000
   429bf:	4c 3b 47 20          	cmp    0x20(%rdi),%r8
   429c3:	73 c7                	jae    4298c <lookup_symbol(unsigned long, char const**, unsigned long*)+0x5e>
   429c5:	eb b4                	jmp    4297b <lookup_symbol(unsigned long, char const**, unsigned long*)+0x4d>
                return false;
   429c7:	b8 00 00 00 00       	mov    $0x0,%eax
            if (!sym.st_value) {
   429cc:	48 85 f6             	test   %rsi,%rsi
   429cf:	74 35                	je     42a06 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xd8>
            if (name) {
   429d1:	48 85 db             	test   %rbx,%rbx
   429d4:	74 0c                	je     429e2 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xb4>
                *name = symtab.strtab + sym.st_name;
   429d6:	8b 07                	mov    (%rdi),%eax
   429d8:	48 03 05 d1 46 00 00 	add    0x46d1(%rip),%rax        # 470b0 <symtab+0x10>
   429df:	48 89 03             	mov    %rax,(%rbx)
            return true;
   429e2:	b8 01 00 00 00       	mov    $0x1,%eax
            if (start) {
   429e7:	4d 85 e4             	test   %r12,%r12
   429ea:	74 1a                	je     42a06 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xd8>
                *start = sym.st_value;
   429ec:	48 8b 47 08          	mov    0x8(%rdi),%rax
   429f0:	49 89 04 24          	mov    %rax,(%r12)
            return true;
   429f4:	b8 01 00 00 00       	mov    $0x1,%eax
   429f9:	eb 0b                	jmp    42a06 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xd8>
            l = m + 1;
   429fb:	48 8d 50 01          	lea    0x1(%rax),%rdx
   429ff:	eb 93                	jmp    42994 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x66>
    return false;
   42a01:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42a06:	5b                   	pop    %rbx
   42a07:	41 5c                	pop    %r12
   42a09:	5d                   	pop    %rbp
   42a0a:	c3                   	ret

0000000000042a0b <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)>:
                                  bool include_rip) {
   42a0b:	55                   	push   %rbp
   42a0c:	48 89 e5             	mov    %rsp,%rbp
   42a0f:	41 57                	push   %r15
   42a11:	41 56                	push   %r14
   42a13:	41 55                	push   %r13
   42a15:	41 54                	push   %r12
   42a17:	53                   	push   %rbx
   42a18:	48 83 ec 28          	sub    $0x28,%rsp
   42a1c:	48 89 fb             	mov    %rdi,%rbx
   42a1f:	49 89 f4             	mov    %rsi,%r12
   42a22:	41 89 d5             	mov    %edx,%r13d
    if (CCOL(cursorpos)) {
   42a25:	8b 05 d1 65 07 00    	mov    0x765d1(%rip),%eax        # b8ffc <cursorpos>
   42a2b:	b9 50 00 00 00       	mov    $0x50,%ecx
   42a30:	99                   	cltd
   42a31:	f7 f9                	idiv   %ecx
   42a33:	85 d2                	test   %edx,%edx
   42a35:	74 0c                	je     42a43 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x38>
        error_printf("\n");
   42a37:	bf 08 58 04 00       	mov    $0x45808,%edi
   42a3c:	b0 00                	mov    $0x0,%al
   42a3e:	e8 b0 2a 00 00       	call   454f3 <error_printf(char const*, ...)>
    if (include_rip && regs.reg_rip) {
   42a43:	45 84 ed             	test   %r13b,%r13b
   42a46:	74 39                	je     42a81 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x76>
   42a48:	48 8b bb 98 00 00 00 	mov    0x98(%rbx),%rdi
   42a4f:	48 85 ff             	test   %rdi,%rdi
   42a52:	74 2d                	je     42a81 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x76>
        if (lookup_symbol(regs.reg_rip, &name, nullptr)) {
   42a54:	ba 00 00 00 00       	mov    $0x0,%edx
   42a59:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
   42a5d:	e8 cc fe ff ff       	call   4292e <lookup_symbol(unsigned long, char const**, unsigned long*)>
   42a62:	84 c0                	test   %al,%al
   42a64:	0f 84 b1 00 00 00    	je     42b1b <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x110>
            error_printf("  #0  %p  <%s>\n", regs.reg_rip, name);
   42a6a:	48 8b b3 98 00 00 00 	mov    0x98(%rbx),%rsi
   42a71:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
   42a75:	bf 19 57 04 00       	mov    $0x45719,%edi
   42a7a:	b0 00                	mov    $0x0,%al
   42a7c:	e8 72 2a 00 00       	call   454f3 <error_printf(char const*, ...)>
        : backtracer(regs, round_up(regs.reg_rsp, PAGESIZE), pt) {
   42a81:	4c 8b ab b0 00 00 00 	mov    0xb0(%rbx),%r13
   42a88:	4d 8d b5 ff 0f 00 00 	lea    0xfff(%r13),%r14
   42a8f:	49 81 e6 00 f0 ff ff 	and    $0xfffffffffffff000,%r14
        : rbp_(regs.reg_rbp), rsp_(regs.reg_rsp), stack_top_(stack_top),
   42a96:	48 8b 5b 20          	mov    0x20(%rbx),%rbx
            || stack_top_ < rbp_
   42a9a:	4c 39 eb             	cmp    %r13,%rbx
   42a9d:	72 57                	jb     42af6 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xeb>
   42a9f:	49 39 de             	cmp    %rbx,%r14
   42aa2:	72 52                	jb     42af6 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xeb>
            || stack_top_ - rbp_ < 16
   42aa4:	4c 89 f0             	mov    %r14,%rax
   42aa7:	48 29 d8             	sub    %rbx,%rax
            || !pt_
   42aaa:	48 83 f8 0f          	cmp    $0xf,%rax
   42aae:	76 46                	jbe    42af6 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xeb>
   42ab0:	4d 85 e4             	test   %r12,%r12
   42ab3:	74 41                	je     42af6 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xeb>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   42ab5:	4c 89 65 b0          	mov    %r12,-0x50(%rbp)
   42ab9:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
   42abd:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   42ac4:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   42acb:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   42ad2:	00 
    real_find(va);
   42ad3:	48 89 de             	mov    %rbx,%rsi
   42ad6:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42ada:	e8 8d f5 ff ff       	call   4206c <vmiter::real_find(unsigned long)>
            || (vmiter(pt_, rbp_).range_perm(16) & PTE_P) == 0
   42adf:	be 10 00 00 00       	mov    $0x10,%esi
   42ae4:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42ae8:	e8 31 f6 ff ff       	call   4211e <vmiter::range_perm(unsigned long) const>
   42aed:	a8 01                	test   $0x1,%al
   42aef:	74 05                	je     42af6 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xeb>
            || (rbp_ & 7) != 0) {
   42af1:	f6 c3 07             	test   $0x7,%bl
   42af4:	74 0b                	je     42b01 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xf6>
            rbp_ = rsp_ = 0;
   42af6:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   42afc:	bb 00 00 00 00       	mov    $0x0,%ebx
            || (vmiter(pt_, rbp_).range_perm(16) & PTE_P) == 0
   42b01:	41 bf 01 00 00 00    	mov    $0x1,%r15d
    for (int frame = 1; bt.ok(); bt.step(), ++frame) {
   42b07:	4d 85 ed             	test   %r13,%r13
   42b0a:	75 27                	jne    42b33 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x128>
}
   42b0c:	48 83 c4 28          	add    $0x28,%rsp
   42b10:	5b                   	pop    %rbx
   42b11:	41 5c                	pop    %r12
   42b13:	41 5d                	pop    %r13
   42b15:	41 5e                	pop    %r14
   42b17:	41 5f                	pop    %r15
   42b19:	5d                   	pop    %rbp
   42b1a:	c3                   	ret
            error_printf("  #0  %p\n", regs.reg_rip);
   42b1b:	48 8b b3 98 00 00 00 	mov    0x98(%rbx),%rsi
   42b22:	bf 29 57 04 00       	mov    $0x45729,%edi
   42b27:	b0 00                	mov    $0x0,%al
   42b29:	e8 c5 29 00 00       	call   454f3 <error_printf(char const*, ...)>
   42b2e:	e9 4e ff ff ff       	jmp    42a81 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x76>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   42b33:	4c 89 65 b0          	mov    %r12,-0x50(%rbp)
   42b37:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
   42b3b:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   42b42:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   42b49:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   42b50:	00 
        return *vmiter(pt_, rbp_ + off).kptr<const uintptr_t*>();
   42b51:	48 8d 73 08          	lea    0x8(%rbx),%rsi
    real_find(va);
   42b55:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42b59:	e8 0e f5 ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   42b5e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42b62:	48 8b 30             	mov    (%rax),%rsi
        return nullptr;
   42b65:	b8 00 00 00 00       	mov    $0x0,%eax
    if (*pep_ & PTE_P) {
   42b6a:	f7 c6 01 00 00 00    	test   $0x1,%esi
   42b70:	74 3b                	je     42bad <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x1a2>
        if (level_ > 0) {
   42b72:	8b 4d c0             	mov    -0x40(%rbp),%ecx
            pa &= ~0x1000UL;
   42b75:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   42b7c:	ff 0f 00 
   42b7f:	48 21 f2             	and    %rsi,%rdx
        if (level_ > 0) {
   42b82:	85 c9                	test   %ecx,%ecx
   42b84:	7f 0d                	jg     42b93 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x188>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   42b86:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   42b8d:	ff 0f 00 
   42b90:	48 21 f2             	and    %rsi,%rdx
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   42b93:	6b c9 09             	imul   $0x9,%ecx,%ecx
   42b96:	83 c1 0c             	add    $0xc,%ecx
        return pa + (va_ & pageoffmask(level_));
   42b99:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   42ba0:	48 d3 e0             	shl    %cl,%rax
   42ba3:	48 f7 d0             	not    %rax
   42ba6:	48 23 45 c8          	and    -0x38(%rbp),%rax
   42baa:	48 01 d0             	add    %rdx,%rax
   42bad:	4c 8b 28             	mov    (%rax),%r13
        if (lookup_symbol(ret_rip - 2, &name, nullptr)) {
   42bb0:	49 8d 7d fe          	lea    -0x2(%r13),%rdi
   42bb4:	ba 00 00 00 00       	mov    $0x0,%edx
   42bb9:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
   42bbd:	e8 6c fd ff ff       	call   4292e <lookup_symbol(unsigned long, char const**, unsigned long*)>
   42bc2:	84 c0                	test   %al,%al
   42bc4:	0f 84 05 01 00 00    	je     42ccf <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2c4>
            error_printf("  #%d  %p  <%s>\n", frame, ret_rip, name);
   42bca:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
   42bce:	4c 89 ea             	mov    %r13,%rdx
   42bd1:	44 89 fe             	mov    %r15d,%esi
   42bd4:	bf fb 56 04 00       	mov    $0x456fb,%edi
   42bd9:	b0 00                	mov    $0x0,%al
   42bdb:	e8 13 29 00 00       	call   454f3 <error_printf(char const*, ...)>
        rsp_ = rbp_ + 16;
   42be0:	4c 8d 6b 10          	lea    0x10(%rbx),%r13
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   42be4:	4c 89 65 b0          	mov    %r12,-0x50(%rbp)
   42be8:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
   42bec:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   42bf3:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   42bfa:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   42c01:	00 
    real_find(va);
   42c02:	48 89 de             	mov    %rbx,%rsi
   42c05:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42c09:	e8 5e f4 ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   42c0e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   42c12:	48 8b 30             	mov    (%rax),%rsi
        return nullptr;
   42c15:	b8 00 00 00 00       	mov    $0x0,%eax
    if (*pep_ & PTE_P) {
   42c1a:	f7 c6 01 00 00 00    	test   $0x1,%esi
   42c20:	74 3b                	je     42c5d <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x252>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   42c22:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   42c29:	ff 0f 00 
   42c2c:	48 21 f2             	and    %rsi,%rdx
        if (level_ > 0) {
   42c2f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
   42c32:	85 c9                	test   %ecx,%ecx
   42c34:	7e 0d                	jle    42c43 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x238>
            pa &= ~0x1000UL;
   42c36:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   42c3d:	ff 0f 00 
   42c40:	48 21 f2             	and    %rsi,%rdx
   42c43:	6b c9 09             	imul   $0x9,%ecx,%ecx
   42c46:	83 c1 0c             	add    $0xc,%ecx
        return pa + (va_ & pageoffmask(level_));
   42c49:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   42c50:	48 d3 e0             	shl    %cl,%rax
   42c53:	48 f7 d0             	not    %rax
   42c56:	48 23 45 c8          	and    -0x38(%rbp),%rax
   42c5a:	48 01 d0             	add    %rdx,%rax
        return *vmiter(pt_, rbp_ + off).kptr<const uintptr_t*>();
   42c5d:	48 8b 18             	mov    (%rax),%rbx
            || stack_top_ < rbp_
   42c60:	49 39 de             	cmp    %rbx,%r14
   42c63:	72 57                	jb     42cbc <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2b1>
   42c65:	4c 39 eb             	cmp    %r13,%rbx
   42c68:	72 52                	jb     42cbc <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2b1>
            || stack_top_ - rbp_ < 16
   42c6a:	4c 89 f0             	mov    %r14,%rax
   42c6d:	48 29 d8             	sub    %rbx,%rax
            || !pt_
   42c70:	48 83 f8 0f          	cmp    $0xf,%rax
   42c74:	76 46                	jbe    42cbc <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2b1>
   42c76:	4d 85 e4             	test   %r12,%r12
   42c79:	74 41                	je     42cbc <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2b1>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   42c7b:	4c 89 65 b0          	mov    %r12,-0x50(%rbp)
   42c7f:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
   42c83:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   42c8a:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   42c91:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   42c98:	00 
    real_find(va);
   42c99:	48 89 de             	mov    %rbx,%rsi
   42c9c:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42ca0:	e8 c7 f3 ff ff       	call   4206c <vmiter::real_find(unsigned long)>
            || (vmiter(pt_, rbp_).range_perm(16) & PTE_P) == 0
   42ca5:	be 10 00 00 00       	mov    $0x10,%esi
   42caa:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   42cae:	e8 6b f4 ff ff       	call   4211e <vmiter::range_perm(unsigned long) const>
   42cb3:	a8 01                	test   $0x1,%al
   42cb5:	74 05                	je     42cbc <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2b1>
            || (rbp_ & 7) != 0) {
   42cb7:	f6 c3 07             	test   $0x7,%bl
   42cba:	74 0b                	je     42cc7 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x2bc>
            rbp_ = rsp_ = 0;
   42cbc:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   42cc2:	bb 00 00 00 00       	mov    $0x0,%ebx
    for (int frame = 1; bt.ok(); bt.step(), ++frame) {
   42cc7:	41 ff c7             	inc    %r15d
   42cca:	e9 38 fe ff ff       	jmp    42b07 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0xfc>
            error_printf("  #%d  %p\n", frame, ret_rip);
   42ccf:	4c 89 ea             	mov    %r13,%rdx
   42cd2:	44 89 fe             	mov    %r15d,%esi
   42cd5:	bf 0e 57 04 00       	mov    $0x4570e,%edi
   42cda:	b0 00                	mov    $0x0,%al
   42cdc:	e8 12 28 00 00       	call   454f3 <error_printf(char const*, ...)>
   42ce1:	e9 fa fe ff ff       	jmp    42be0 <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)+0x1d5>

0000000000042ce6 <error_vprintf(int, int, char const*, __va_list_tag*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
   42ce6:	f3 0f 1e fa          	endbr64
   42cea:	55                   	push   %rbp
   42ceb:	48 89 e5             	mov    %rsp,%rbp
   42cee:	41 56                	push   %r14
   42cf0:	41 55                	push   %r13
   42cf2:	41 54                	push   %r12
   42cf4:	53                   	push   %rbx
   42cf5:	48 83 ec 20          	sub    $0x20,%rsp
   42cf9:	41 89 fd             	mov    %edi,%r13d
   42cfc:	41 89 f6             	mov    %esi,%r14d
   42cff:	49 89 d4             	mov    %rdx,%r12
   42d02:	48 89 cb             	mov    %rcx,%rbx
    __builtin_va_copy(val2, val);
   42d05:	48 8d 45 c8          	lea    -0x38(%rbp),%rax
   42d09:	b9 06 00 00 00       	mov    $0x6,%ecx
   42d0e:	48 89 c7             	mov    %rax,%rdi
   42d11:	48 89 de             	mov    %rbx,%rsi
   42d14:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
    log_vprintf(format, val2);
   42d16:	48 89 c6             	mov    %rax,%rsi
   42d19:	48 89 d7             	mov    %rdx,%rdi
   42d1c:	e8 a1 fb ff ff       	call   428c2 <log_vprintf(char const*, __va_list_tag*)>
    return console_vprintf(cpos, color, format, val);
   42d21:	48 89 d9             	mov    %rbx,%rcx
   42d24:	4c 89 e2             	mov    %r12,%rdx
   42d27:	44 89 f6             	mov    %r14d,%esi
   42d2a:	44 89 ef             	mov    %r13d,%edi
   42d2d:	e8 e4 26 00 00       	call   45416 <console_vprintf(int, int, char const*, __va_list_tag*)>
}
   42d32:	48 83 c4 20          	add    $0x20,%rsp
   42d36:	5b                   	pop    %rbx
   42d37:	41 5c                	pop    %r12
   42d39:	41 5d                	pop    %r13
   42d3b:	41 5e                	pop    %r14
   42d3d:	5d                   	pop    %rbp
   42d3e:	c3                   	ret

0000000000042d3f <strlcpy_from_user(char*, vmiter, unsigned long)>:
void strlcpy_from_user(char* buf, vmiter it, size_t maxlen) {
   42d3f:	f3 0f 1e fa          	endbr64
   42d43:	55                   	push   %rbp
   42d44:	48 89 e5             	mov    %rsp,%rbp
   42d47:	41 57                	push   %r15
   42d49:	41 56                	push   %r14
   42d4b:	41 55                	push   %r13
   42d4d:	41 54                	push   %r12
   42d4f:	53                   	push   %rbx
   42d50:	48 83 ec 08          	sub    $0x8,%rsp
   42d54:	49 89 fc             	mov    %rdi,%r12
   42d57:	49 89 f7             	mov    %rsi,%r15
    while (i + 1 < maxlen && it.user()) {
   42d5a:	48 83 fe 01          	cmp    $0x1,%rsi
   42d5e:	0f 86 b9 00 00 00    	jbe    42e1d <strlcpy_from_user(char*, vmiter, unsigned long)+0xde>
   42d64:	4c 8d 6e ff          	lea    -0x1(%rsi),%r13
   42d68:	bb 00 00 00 00       	mov    $0x0,%ebx
        return pa + (va_ & pageoffmask(level_));
   42d6d:	49 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%r14
   42d74:	eb 22                	jmp    42d98 <strlcpy_from_user(char*, vmiter, unsigned long)+0x59>
        return nullptr;
   42d76:	b8 00 00 00 00       	mov    $0x0,%eax
        buf[i] = *it.kptr<const char*>();
   42d7b:	0f b6 00             	movzbl (%rax),%eax
   42d7e:	41 88 04 34          	mov    %al,(%r12,%rsi,1)
    return find(va_ + 1);
   42d82:	48 8b 45 28          	mov    0x28(%rbp),%rax
   42d86:	48 8d 70 01          	lea    0x1(%rax),%rsi
        real_find(va);
   42d8a:	48 8d 7d 10          	lea    0x10(%rbp),%rdi
   42d8e:	e8 d9 f2 ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    while (i + 1 < maxlen && it.user()) {
   42d93:	49 39 dd             	cmp    %rbx,%r13
   42d96:	74 69                	je     42e01 <strlcpy_from_user(char*, vmiter, unsigned long)+0xc2>
   42d98:	48 89 de             	mov    %rbx,%rsi
   42d9b:	48 83 c3 01          	add    $0x1,%rbx
    uint64_t ph = *pep_ & perm_;
   42d9f:	48 8b 45 18          	mov    0x18(%rbp),%rax
   42da3:	48 8b 10             	mov    (%rax),%rdx
   42da6:	48 63 4d 24          	movslq 0x24(%rbp),%rcx
   42daa:	48 21 d1             	and    %rdx,%rcx
    return ph & -(ph & PTE_P);
   42dad:	48 89 c8             	mov    %rcx,%rax
   42db0:	83 e0 01             	and    $0x1,%eax
   42db3:	48 f7 d8             	neg    %rax
   42db6:	48 21 c8             	and    %rcx,%rax
   42db9:	48 f7 d0             	not    %rax
   42dbc:	a8 05                	test   $0x5,%al
   42dbe:	75 44                	jne    42e04 <strlcpy_from_user(char*, vmiter, unsigned long)+0xc5>
    if (*pep_ & PTE_P) {
   42dc0:	f6 c2 01             	test   $0x1,%dl
   42dc3:	74 b1                	je     42d76 <strlcpy_from_user(char*, vmiter, unsigned long)+0x37>
        if (level_ > 0) {
   42dc5:	8b 45 20             	mov    0x20(%rbp),%eax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   42dc8:	48 bf 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdi
   42dcf:	ff 0f 00 
   42dd2:	48 21 d7             	and    %rdx,%rdi
   42dd5:	48 b9 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rcx
   42ddc:	ff 0f 00 
   42ddf:	48 21 ca             	and    %rcx,%rdx
   42de2:	85 c0                	test   %eax,%eax
   42de4:	48 0f 4f fa          	cmovg  %rdx,%rdi
   42de8:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   42dec:	4c 89 f0             	mov    %r14,%rax
   42def:	48 d3 e0             	shl    %cl,%rax
   42df2:	48 f7 d0             	not    %rax
   42df5:	48 23 45 28          	and    0x28(%rbp),%rax
   42df9:	48 01 f8             	add    %rdi,%rax
        return reinterpret_cast<T>(pa());
   42dfc:	e9 7a ff ff ff       	jmp    42d7b <strlcpy_from_user(char*, vmiter, unsigned long)+0x3c>
   42e01:	48 89 de             	mov    %rbx,%rsi
    if (i < maxlen) {
   42e04:	4c 39 fe             	cmp    %r15,%rsi
   42e07:	73 05                	jae    42e0e <strlcpy_from_user(char*, vmiter, unsigned long)+0xcf>
        buf[i] = '\0';
   42e09:	41 c6 04 34 00       	movb   $0x0,(%r12,%rsi,1)
}
   42e0e:	48 83 c4 08          	add    $0x8,%rsp
   42e12:	5b                   	pop    %rbx
   42e13:	41 5c                	pop    %r12
   42e15:	41 5d                	pop    %r13
   42e17:	41 5e                	pop    %r14
   42e19:	41 5f                	pop    %r15
   42e1b:	5d                   	pop    %rbp
   42e1c:	c3                   	ret
    size_t i = 0;
   42e1d:	be 00 00 00 00       	mov    $0x0,%esi
   42e22:	eb e0                	jmp    42e04 <strlcpy_from_user(char*, vmiter, unsigned long)+0xc5>

0000000000042e24 <assert_fail(char const*, int, char const*, char const*)>:
                 const char* description) {
   42e24:	f3 0f 1e fa          	endbr64
   42e28:	55                   	push   %rbp
   42e29:	48 89 e5             	mov    %rsp,%rbp
   42e2c:	41 55                	push   %r13
   42e2e:	41 54                	push   %r12
   42e30:	53                   	push   %rbx
   42e31:	48 83 ec 08          	sub    $0x8,%rsp
   42e35:	48 89 fb             	mov    %rdi,%rbx
   42e38:	41 89 f4             	mov    %esi,%r12d
   42e3b:	49 89 d5             	mov    %rdx,%r13
    cursorpos = CPOS(23, 0);
   42e3e:	c7 05 b4 61 07 00 30 	movl   $0x730,0x761b4(%rip)        # b8ffc <cursorpos>
   42e45:	07 00 00 
    if (description) {
   42e48:	48 85 c9             	test   %rcx,%rcx
   42e4b:	74 11                	je     42e5e <assert_fail(char const*, int, char const*, char const*)+0x3a>
        error_printf("%s:%d: %s\n", file, line, description);
   42e4d:	89 f2                	mov    %esi,%edx
   42e4f:	48 89 fe             	mov    %rdi,%rsi
   42e52:	bf 33 57 04 00       	mov    $0x45733,%edi
   42e57:	b0 00                	mov    $0x0,%al
   42e59:	e8 95 26 00 00       	call   454f3 <error_printf(char const*, ...)>
    error_printf("%s:%d: kernel assertion '%s' failed\n", file, line, msg);
   42e5e:	4c 89 e9             	mov    %r13,%rcx
   42e61:	44 89 e2             	mov    %r12d,%edx
   42e64:	48 89 de             	mov    %rbx,%rsi
   42e67:	bf 30 5c 04 00       	mov    $0x45c30,%edi
   42e6c:	b0 00                	mov    $0x0,%al
   42e6e:	e8 80 26 00 00       	call   454f3 <error_printf(char const*, ...)>
    return x;
}

__always_inline uintptr_t rdcr3() {
    uintptr_t x;
    asm volatile("movq %%cr3, %0" : "=r" (x));
   42e73:	0f 20 de             	mov    %cr3,%rsi
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
   42e76:	48 89 e0             	mov    %rsp,%rax
    backtrace_kernel_regs.reg_rsp = rdrsp();
   42e79:	48 89 05 10 d3 01 00 	mov    %rax,0x1d310(%rip)        # 60190 <backtrace_current_regs()::backtrace_kernel_regs+0xb0>
    asm volatile("movq %%rbp, %0" : "=r" (x));
   42e80:	48 89 e8             	mov    %rbp,%rax
    backtrace_kernel_regs.reg_rbp = rdrbp();
   42e83:	48 89 05 76 d2 01 00 	mov    %rax,0x1d276(%rip)        # 60100 <backtrace_current_regs()::backtrace_kernel_regs+0x20>
    backtrace_kernel_regs.reg_rip = 0;
   42e8a:	48 c7 05 e3 d2 01 00 	movq   $0x0,0x1d2e3(%rip)        # 60178 <backtrace_current_regs()::backtrace_kernel_regs+0x98>
   42e91:	00 00 00 00 
    error_print_backtrace(backtrace_current_regs(), backtrace_current_pagetable(), false);
   42e95:	ba 00 00 00 00       	mov    $0x0,%edx
   42e9a:	bf e0 00 06 00       	mov    $0x600e0,%edi
   42e9f:	e8 67 fb ff ff       	call   42a0b <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)>
        check_keyboard();
   42ea4:	e8 b6 08 00 00       	call   4375f <check_keyboard()>
    while (true) {
   42ea9:	eb f9                	jmp    42ea4 <assert_fail(char const*, int, char const*, char const*)+0x80>

0000000000042eab <init_hardware()>:
void init_hardware() {
   42eab:	f3 0f 1e fa          	endbr64
   42eaf:	55                   	push   %rbp
   42eb0:	48 89 e5             	mov    %rsp,%rbp
   42eb3:	53                   	push   %rbx
   42eb4:	48 83 ec 38          	sub    $0x38,%rsp
    stash_kernel_data(false);
   42eb8:	bf 00 00 00 00       	mov    $0x0,%edi
   42ebd:	e8 f7 f6 ff ff       	call   425b9 <stash_kernel_data(bool)>
    gdt_segments[0] = 0;
   42ec2:	48 c7 05 d3 d1 01 00 	movq   $0x0,0x1d1d3(%rip)        # 600a0 <gdt_segments>
   42ec9:	00 00 00 00 
    *segment = type
   42ecd:	48 b8 00 00 00 00 00 	movabs $0x20980000000000,%rax
   42ed4:	98 20 00 
   42ed7:	48 89 05 ca d1 01 00 	mov    %rax,0x1d1ca(%rip)        # 600a8 <gdt_segments+0x8>
   42ede:	48 b8 00 00 00 00 00 	movabs $0x920000000000,%rax
   42ee5:	92 00 00 
   42ee8:	48 89 05 c1 d1 01 00 	mov    %rax,0x1d1c1(%rip)        # 600b0 <gdt_segments+0x10>
    gdt.limit = sizeof(gdt_segments[0]) * 3 - 1;
   42eef:	66 c7 45 c6 17 00    	movw   $0x17,-0x3a(%rbp)
    gdt.base = (uint64_t) gdt_segments;
   42ef5:	48 c7 45 c8 a0 00 06 	movq   $0x600a0,-0x38(%rbp)
   42efc:	00 
    asm volatile("lgdt %0" : : "m" (gdt.limit));
   42efd:	0f 01 55 c6          	lgdt   -0x3a(%rbp)
    memset(kernel_pagetable, 0, sizeof(kernel_pagetable));
   42f01:	ba 00 50 00 00       	mov    $0x5000,%edx
   42f06:	be 00 00 00 00       	mov    $0x0,%esi
   42f0b:	bf 00 b0 05 00       	mov    $0x5b000,%edi
   42f10:	e8 2b 19 00 00       	call   44840 <memset>
        kptr2pa(&kernel_pagetable[1]) | PTE_P | PTE_W | PTE_U;
   42f15:	b8 00 c0 05 00       	mov    $0x5c000,%eax
   42f1a:	48 83 c8 07          	or     $0x7,%rax
   42f1e:	48 89 05 db 80 01 00 	mov    %rax,0x180db(%rip)        # 5b000 <kernel_pagetable>
        kptr2pa(&kernel_pagetable[2]) | PTE_P | PTE_W | PTE_U;
   42f25:	b8 00 d0 05 00       	mov    $0x5d000,%eax
   42f2a:	48 83 c8 07          	or     $0x7,%rax
   42f2e:	48 89 05 cb 90 01 00 	mov    %rax,0x190cb(%rip)        # 5c000 <kernel_pagetable+0x1000>
        kptr2pa(&kernel_pagetable[3]) | PTE_P | PTE_W | PTE_U;
   42f35:	b8 00 e0 05 00       	mov    $0x5e000,%eax
   42f3a:	48 83 c8 07          	or     $0x7,%rax
   42f3e:	48 89 05 bb a0 01 00 	mov    %rax,0x1a0bb(%rip)        # 5d000 <kernel_pagetable+0x2000>
        kptr2pa(&kernel_pagetable[4]) | PTE_P | PTE_W | PTE_U;
   42f45:	b8 00 f0 05 00       	mov    $0x5f000,%eax
   42f4a:	48 83 c8 07          	or     $0x7,%rax
   42f4e:	48 89 05 b3 a0 01 00 	mov    %rax,0x1a0b3(%rip)        # 5d008 <kernel_pagetable+0x2008>
    kernel_pagetable[1].entry[1] =
   42f55:	48 c7 05 a8 90 01 00 	movq   $0x40000083,0x190a8(%rip)        # 5c008 <kernel_pagetable+0x1008>
   42f5c:	83 00 00 40 
    kernel_pagetable[1].entry[2] =
   42f60:	b8 83 00 00 80       	mov    $0x80000083,%eax
   42f65:	48 89 05 a4 90 01 00 	mov    %rax,0x190a4(%rip)        # 5c010 <kernel_pagetable+0x1010>
    kernel_pagetable[1].entry[3] =
   42f6c:	48 8d 80 00 00 00 40 	lea    0x40000000(%rax),%rax
   42f73:	48 89 05 9e 90 01 00 	mov    %rax,0x1909e(%rip)        # 5c018 <kernel_pagetable+0x1018>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   42f7a:	48 c7 45 d0 00 b0 05 	movq   $0x5b000,-0x30(%rbp)
   42f81:	00 
   42f82:	48 c7 45 d8 00 b0 05 	movq   $0x5b000,-0x28(%rbp)
   42f89:	00 
   42f8a:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   42f91:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   42f98:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   42f9f:	00 
    real_find(va);
   42fa0:	be 00 00 00 00       	mov    $0x0,%esi
   42fa5:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   42fa9:	e8 be f0 ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   42fae:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
         it.va() < MEMSIZE_PHYSICAL;
   42fb2:	48 81 fe ff ff 1f 00 	cmp    $0x1fffff,%rsi
   42fb9:	76 72                	jbe    4302d <init_hardware()+0x182>
    asm volatile("movq %0, %%cr3" : : "r" (x) : "memory");
   42fbb:	b8 00 b0 05 00       	mov    $0x5b000,%eax
   42fc0:	0f 22 d8             	mov    %rax,%cr3
    cursorpos = 3 * CONSOLE_COLUMNS;
   42fc3:	c7 05 2f 60 07 00 f0 	movl   $0xf0,0x7602f(%rip)        # b8ffc <cursorpos>
   42fca:	00 00 00 
   42fcd:	b9 a0 71 05 00       	mov    $0x571a0,%ecx
    for (int i = 0; i < 256; ++i) {
   42fd2:	be 00 00 00 00       	mov    $0x0,%esi
        | ((addr & 0x00000000FFFF0000UL) << 32);
   42fd7:	49 b8 00 00 00 00 00 	movabs $0xffff000000000000,%r8
   42fde:	00 ff ff 
   42fe1:	49 b9 00 00 00 00 00 	movabs $0x600000000000,%r9
   42fe8:	60 00 00 
   42feb:	48 bf 00 00 08 00 00 	movabs $0x8e0000080000,%rdi
   42ff2:	8e 00 00 
   42ff5:	e9 f9 00 00 00       	jmp    430f3 <init_hardware()+0x248>
    int r = try_map(pa, perm);
   42ffa:	ba 07 00 00 00       	mov    $0x7,%edx
   42fff:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   43003:	e8 7a f2 ff ff       	call   42282 <vmiter::try_map(unsigned long, int)>
    assert(r == 0, "vmiter::map failed");
   43008:	85 c0                	test   %eax,%eax
   4300a:	75 28                	jne    43034 <init_hardware()+0x189>
    return find(va_ + delta);
   4300c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   43010:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   43017:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   4301b:	e8 4c f0 ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   43020:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
         it.va() < MEMSIZE_PHYSICAL;
   43024:	48 81 fe ff ff 1f 00 	cmp    $0x1fffff,%rsi
   4302b:	77 8e                	ja     42fbb <init_hardware()+0x110>
        if (it.va() != 0) {
   4302d:	48 85 f6             	test   %rsi,%rsi
   43030:	74 da                	je     4300c <init_hardware()+0x161>
   43032:	eb c6                	jmp    42ffa <init_hardware()+0x14f>
    assert(r == 0, "vmiter::map failed");
   43034:	b9 3e 57 04 00       	mov    $0x4573e,%ecx
   43039:	ba b2 55 04 00       	mov    $0x455b2,%edx
   4303e:	be f4 00 00 00       	mov    $0xf4,%esi
   43043:	bf 51 57 04 00       	mov    $0x45751,%edi
   43048:	e8 d7 fd ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
    assert(cpuid(1).edx & (1 << 9));
   4304d:	b9 00 00 00 00       	mov    $0x0,%ecx
   43052:	ba 5d 57 04 00       	mov    $0x4575d,%edx
   43057:	be a4 00 00 00       	mov    $0xa4,%esi
   4305c:	bf 75 57 04 00       	mov    $0x45775,%edi
   43061:	e8 be fd ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
    assert(apic_base & IA32_APIC_BASE_ENABLED);
   43066:	b9 00 00 00 00       	mov    $0x0,%ecx
   4306b:	ba 58 5c 04 00       	mov    $0x45c58,%edx
   43070:	be a6 00 00 00       	mov    $0xa6,%esi
   43075:	bf 75 57 04 00       	mov    $0x45775,%edi
   4307a:	e8 a5 fd ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
    assert((apic_base & 0xFFFFFFFFF000) == lapicstate::lapic_pa);
   4307f:	b9 00 00 00 00       	mov    $0x0,%ecx
   43084:	ba 80 5c 04 00       	mov    $0x45c80,%edx
   43089:	be a7 00 00 00       	mov    $0xa7,%esi
   4308e:	bf 75 57 04 00       	mov    $0x45775,%edi
   43093:	e8 8c fd ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
    assert((ioapic_ver & 0xFF) == 0x11 || (ioapic_ver & 0xFF) == 0x20);
   43098:	b9 00 00 00 00       	mov    $0x0,%ecx
   4309d:	ba b8 5c 04 00       	mov    $0x45cb8,%edx
   430a2:	be ac 00 00 00       	mov    $0xac,%esi
   430a7:	bf 75 57 04 00       	mov    $0x45775,%edi
   430ac:	e8 73 fd ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
    assert((ioapic_ver >> 16) >= 0x17);
   430b1:	b9 00 00 00 00       	mov    $0x0,%ecx
   430b6:	ba 83 57 04 00       	mov    $0x45783,%edx
   430bb:	be ad 00 00 00       	mov    $0xad,%esi
   430c0:	bf 75 57 04 00       	mov    $0x45775,%edi
   430c5:	e8 5a fd ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
        | ((addr & 0x00000000FFFF0000UL) << 32);
   430ca:	48 89 d0             	mov    %rdx,%rax
   430cd:	48 c1 e0 20          	shl    $0x20,%rax
   430d1:	4c 21 c0             	and    %r8,%rax
    gate->gd_low = (addr & 0x000000000000FFFFUL)
   430d4:	44 0f b7 d2          	movzwl %dx,%r10d
        | ((addr & 0x00000000FFFF0000UL) << 32);
   430d8:	4d 09 ca             	or     %r9,%r10
   430db:	4c 09 d0             	or     %r10,%rax
   430de:	48 09 f8             	or     %rdi,%rax
   430e1:	48 89 01             	mov    %rax,(%rcx)
    gate->gd_high = addr >> 32;
   430e4:	48 c1 ea 20          	shr    $0x20,%rdx
   430e8:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    for (int i = 0; i < 256; ++i) {
   430ec:	83 c6 01             	add    $0x1,%esi
   430ef:	48 83 c1 10          	add    $0x10,%rcx
        uintptr_t addr = interrupt_descriptors[i].gd_low;
   430f3:	48 8b 11             	mov    (%rcx),%rdx
        set_gate(&interrupt_descriptors[i], addr,
   430f6:	83 fe 03             	cmp    $0x3,%esi
   430f9:	74 cf                	je     430ca <init_hardware()+0x21f>
        | ((addr & 0x00000000FFFF0000UL) << 32);
   430fb:	48 89 d0             	mov    %rdx,%rax
   430fe:	48 c1 e0 20          	shl    $0x20,%rax
   43102:	4c 21 c0             	and    %r8,%rax
    gate->gd_low = (addr & 0x000000000000FFFFUL)
   43105:	44 0f b7 d2          	movzwl %dx,%r10d
        | ((addr & 0x00000000FFFF0000UL) << 32);
   43109:	4c 09 d0             	or     %r10,%rax
   4310c:	48 09 f8             	or     %rdi,%rax
   4310f:	48 89 01             	mov    %rax,(%rcx)
    gate->gd_high = addr >> 32;
   43112:	48 c1 ea 20          	shr    $0x20,%rdx
   43116:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    for (int i = 0; i < 256; ++i) {
   4311a:	83 c6 01             	add    $0x1,%esi
   4311d:	48 83 c1 10          	add    $0x10,%rcx
   43121:	81 fe 00 01 00 00    	cmp    $0x100,%esi
   43127:	75 ca                	jne    430f3 <init_hardware()+0x248>
    uint32_t eax, ebx, ecx, edx;
} x86_64_cpuid_t;

__always_inline x86_64_cpuid_t cpuid(uint32_t leaf) {
    x86_64_cpuid_t ret;
    asm volatile("cpuid"
   43129:	b8 01 00 00 00       	mov    $0x1,%eax
   4312e:	0f a2                	cpuid
    assert(cpuid(1).edx & (1 << 9));
   43130:	f6 c6 02             	test   $0x2,%dh
   43133:	0f 84 14 ff ff ff    	je     4304d <init_hardware()+0x1a2>
    return ret;
}

__always_inline uint64_t rdmsr(uint32_t msr) {
    uint64_t low, high;
    asm volatile("rdmsr" : "=a" (low), "=d" (high) : "c" (msr));
   43139:	b9 1b 00 00 00       	mov    $0x1b,%ecx
   4313e:	0f 32                	rdmsr
    return low | (high << 32);
   43140:	48 c1 e2 20          	shl    $0x20,%rdx
   43144:	48 09 c2             	or     %rax,%rdx
    assert(apic_base & IA32_APIC_BASE_ENABLED);
   43147:	f6 c4 08             	test   $0x8,%ah
   4314a:	0f 84 16 ff ff ff    	je     43066 <init_hardware()+0x1bb>
    assert((apic_base & 0xFFFFFFFFF000) == lapicstate::lapic_pa);
   43150:	48 b8 00 f0 ff ff ff 	movabs $0xfffffffff000,%rax
   43157:	ff 00 00 
   4315a:	48 21 c2             	and    %rax,%rdx
   4315d:	b8 00 00 e0 fe       	mov    $0xfee00000,%eax
   43162:	48 39 c2             	cmp    %rax,%rdx
   43165:	0f 85 14 ff ff ff    	jne    4307f <init_hardware()+0x1d4>
inline void ioapicstate::disable_irq(int entry) {
    write(reg_redtbl + 2 * entry, redtbl_masked);
    write(reg_redtbl + 2 * entry + 1, 0);
}
inline uint32_t ioapicstate::read(int reg) const {
    reg_[0].v = reg;
   4316b:	b8 00 00 c0 fe       	mov    $0xfec00000,%eax
   43170:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
    return reg_[1].v;
   43176:	8b 40 10             	mov    0x10(%rax),%eax
    assert((ioapic_ver & 0xFF) == 0x11 || (ioapic_ver & 0xFF) == 0x20);
   43179:	0f b6 d0             	movzbl %al,%edx
   4317c:	3c 20                	cmp    $0x20,%al
   4317e:	74 09                	je     43189 <init_hardware()+0x2de>
   43180:	83 fa 11             	cmp    $0x11,%edx
   43183:	0f 85 0f ff ff ff    	jne    43098 <init_hardware()+0x1ed>
    assert((ioapic_ver >> 16) >= 0x17);
   43189:	3d ff ff 16 00       	cmp    $0x16ffff,%eax
   4318e:	0f 86 1d ff ff ff    	jbe    430b1 <init_hardware()+0x206>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
   43194:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43199:	ba 21 00 00 00       	mov    $0x21,%edx
   4319e:	ee                   	out    %al,(%dx)
   4319f:	ba a1 00 00 00       	mov    $0xa1,%edx
   431a4:	ee                   	out    %al,(%dx)
    for (auto fp = __init_array_start; fp != __init_array_end; ++fp) {
   431a5:	b8 80 68 04 00       	mov    $0x46880,%eax
   431aa:	48 3d 80 68 04 00    	cmp    $0x46880,%rax
   431b0:	74 12                	je     431c4 <init_hardware()+0x319>
   431b2:	48 89 c3             	mov    %rax,%rbx
        (*fp)();
   431b5:	ff 13                	call   *(%rbx)
    for (auto fp = __init_array_start; fp != __init_array_end; ++fp) {
   431b7:	48 83 c3 08          	add    $0x8,%rbx
   431bb:	48 81 fb 80 68 04 00 	cmp    $0x46880,%rbx
   431c2:	75 f1                	jne    431b5 <init_hardware()+0x30a>
    gdt_segments[0] = 0;
   431c4:	48 c7 05 d1 ce 01 00 	movq   $0x0,0x1ced1(%rip)        # 600a0 <gdt_segments>
   431cb:	00 00 00 00 
    *segment = type
   431cf:	48 b8 00 00 00 00 00 	movabs $0x20980000000000,%rax
   431d6:	98 20 00 
   431d9:	48 89 05 c8 ce 01 00 	mov    %rax,0x1cec8(%rip)        # 600a8 <gdt_segments+0x8>
   431e0:	48 b8 00 00 00 00 00 	movabs $0x920000000000,%rax
   431e7:	92 00 00 
   431ea:	48 89 05 bf ce 01 00 	mov    %rax,0x1cebf(%rip)        # 600b0 <gdt_segments+0x10>
   431f1:	48 b8 00 00 00 00 00 	movabs $0x20f80000000000,%rax
   431f8:	f8 20 00 
   431fb:	48 89 05 b6 ce 01 00 	mov    %rax,0x1ceb6(%rip)        # 600b8 <gdt_segments+0x18>
   43202:	48 b8 00 00 00 00 00 	movabs $0xf20000000000,%rax
   43209:	f2 00 00 
   4320c:	48 89 05 ad ce 01 00 	mov    %rax,0x1cead(%rip)        # 600c0 <gdt_segments+0x20>
    set_sys_segment(&gdt_segments[SEGSEL_TASKSTATE >> 3],
   43213:	ba 20 00 06 00       	mov    $0x60020,%edx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   43218:	48 89 d0             	mov    %rdx,%rax
   4321b:	48 c1 e0 10          	shl    $0x10,%rax
   4321f:	48 b9 00 00 ff ff ff 	movabs $0xffffff0000,%rcx
   43226:	00 00 00 
   43229:	48 21 c8             	and    %rcx,%rax
        | ((addr & 0x00000000FF000000UL) << 32)
   4322c:	48 89 d1             	mov    %rdx,%rcx
   4322f:	48 c1 e1 20          	shl    $0x20,%rcx
   43233:	48 be 00 00 00 00 00 	movabs $0xff00000000000000,%rsi
   4323a:	00 00 ff 
   4323d:	48 21 f1             	and    %rsi,%rcx
   43240:	48 09 c8             	or     %rcx,%rax
        | X86SEG_P;                   // segment present
   43243:	48 b9 67 00 00 00 00 	movabs $0x890000000067,%rcx
   4324a:	89 00 00 
   4324d:	48 09 c8             	or     %rcx,%rax
   43250:	48 89 05 71 ce 01 00 	mov    %rax,0x1ce71(%rip)        # 600c8 <gdt_segments+0x28>
    segment[1] = addr >> 32;
   43257:	48 c1 ea 20          	shr    $0x20,%rdx
   4325b:	48 89 15 6e ce 01 00 	mov    %rdx,0x1ce6e(%rip)        # 600d0 <gdt_segments+0x30>
    memset(&taskstate, 0, sizeof(taskstate));
   43262:	ba 68 00 00 00       	mov    $0x68,%edx
   43267:	be 00 00 00 00       	mov    $0x0,%esi
   4326c:	bf 20 00 06 00       	mov    $0x60020,%edi
   43271:	e8 ca 15 00 00       	call   44840 <memset>
    taskstate.ts_rsp[0] = KERNEL_STACK_TOP;
   43276:	48 c7 05 a3 cd 01 00 	movq   $0x80000,0x1cda3(%rip)        # 60024 <taskstate+0x4>
   4327d:	00 00 08 00 
    gdt.limit = sizeof(gdt_segments) - 1;
   43281:	66 c7 45 c6 37 00    	movw   $0x37,-0x3a(%rbp)
    gdt.base = (uint64_t) gdt_segments;
   43287:	48 c7 45 c8 a0 00 06 	movq   $0x600a0,-0x38(%rbp)
   4328e:	00 
    idt.limit = sizeof(interrupt_descriptors) - 1;
   4328f:	66 c7 45 d6 ff 0f    	movw   $0xfff,-0x2a(%rbp)
    idt.base = (uint64_t) interrupt_descriptors;
   43295:	48 c7 45 d8 a0 71 05 	movq   $0x571a0,-0x28(%rbp)
   4329c:	00 
    asm volatile("lgdt %0; ltr %1; lidt %2"
   4329d:	b8 28 00 00 00       	mov    $0x28,%eax
   432a2:	0f 01 55 c6          	lgdt   -0x3a(%rbp)
   432a6:	0f 00 d8             	ltr    %eax
   432a9:	0f 01 5d d6          	lidt   -0x2a(%rbp)
    asm volatile("movw %%ax, %%fs; movw %%ax, %%gs"
   432ad:	b8 10 00 00 00       	mov    $0x10,%eax
   432b2:	8e e0                	mov    %eax,%fs
   432b4:	8e e8                	mov    %eax,%gs
    asm volatile("movq %%cr0, %0" : "=r" (x));
   432b6:	0f 20 c0             	mov    %cr0,%rax
    wrcr0(cr0);
   432b9:	0d 23 00 05 80       	or     $0x80050023,%eax
    asm volatile("movq %0, %%cr0" : : "r" (x));
   432be:	0f 22 c0             	mov    %rax,%cr0
}
__always_inline void wrmsr(uint32_t msr, uint64_t x) {
    asm volatile("wrmsr" : : "c" (msr), "a" ((uint32_t) x), "d" (x >> 32));
   432c1:	b9 81 00 00 c0       	mov    $0xc0000081,%ecx
   432c6:	b8 00 00 00 00       	mov    $0x0,%eax
   432cb:	ba 08 00 18 00       	mov    $0x180008,%edx
   432d0:	0f 30                	wrmsr
    wrmsr(MSR_IA32_LSTAR, reinterpret_cast<uint64_t>(syscall_entry));
   432d2:	b8 d6 0a 04 00       	mov    $0x40ad6,%eax
   432d7:	48 89 c2             	mov    %rax,%rdx
   432da:	48 c1 ea 20          	shr    $0x20,%rdx
   432de:	b9 82 00 00 c0       	mov    $0xc0000082,%ecx
   432e3:	0f 30                	wrmsr
   432e5:	b9 84 00 00 c0       	mov    $0xc0000084,%ecx
   432ea:	b8 00 77 04 00       	mov    $0x47700,%eax
   432ef:	ba 00 00 00 00       	mov    $0x0,%edx
   432f4:	0f 30                	wrmsr
    return reg_[reg].v;
   432f6:	b8 00 00 e0 fe       	mov    $0xfee00000,%eax
   432fb:	8b 90 f0 00 00 00    	mov    0xf0(%rax),%edx
    write(reg_svr, (read(reg_svr) & ~0xFF) | 0x100 | vector);
   43301:	81 e2 00 fe ff ff    	and    $0xfffffe00,%edx
   43307:	81 ca 3f 01 00 00    	or     $0x13f,%edx
    reg_[reg].v = v;
   4330d:	89 90 f0 00 00 00    	mov    %edx,0xf0(%rax)
   43313:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%rax)
   4331a:	00 00 00 
   4331d:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%rax)
   43324:	00 02 00 
   43327:	c7 80 80 03 00 00 00 	movl   $0x0,0x380(%rax)
   4332e:	00 00 00 
   43331:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%rax)
   43338:	00 01 00 
   4333b:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%rax)
   43342:	00 01 00 
   43345:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%rax)
   4334c:	00 00 00 
   4334f:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%rax)
   43356:	00 00 00 
    return reg_[reg].v;
   43359:	8b 90 80 02 00 00    	mov    0x280(%rax),%edx
    reg_[reg].v = v;
   4335f:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%rax)
   43366:	00 00 00 
}
   43369:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   4336d:	c9                   	leave
   4336e:	c3                   	ret

000000000004336f <check_pagetable(x86_64_pagetable*)>:
void check_pagetable(x86_64_pagetable* pagetable) {
   4336f:	f3 0f 1e fa          	endbr64
   43373:	55                   	push   %rbp
   43374:	48 89 e5             	mov    %rsp,%rbp
   43377:	53                   	push   %rbx
   43378:	48 83 ec 28          	sub    $0x28,%rsp
    assert(((uintptr_t) pagetable % PAGESIZE) == 0); // must be page aligned
   4337c:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
   43382:	0f 85 78 01 00 00    	jne    43500 <check_pagetable(x86_64_pagetable*)+0x191>
   43388:	48 89 fb             	mov    %rdi,%rbx
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4338b:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
   4338f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43393:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   4339a:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   433a1:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   433a8:	00 
    real_find(va);
   433a9:	be 72 0a 04 00       	mov    $0x40a72,%esi
   433ae:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   433b2:	e8 b5 ec ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   433b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   433bb:	48 8b 08             	mov    (%rax),%rcx
   433be:	f6 c1 01             	test   $0x1,%cl
   433c1:	0f 84 64 01 00 00    	je     4352b <check_pagetable(x86_64_pagetable*)+0x1bc>
        if (level_ > 0) {
   433c7:	8b 45 e0             	mov    -0x20(%rbp),%eax
            pa &= ~0x1000UL;
   433ca:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   433d1:	ff 0f 00 
   433d4:	48 21 ca             	and    %rcx,%rdx
        if (level_ > 0) {
   433d7:	85 c0                	test   %eax,%eax
   433d9:	0f 8e 3a 01 00 00    	jle    43519 <check_pagetable(x86_64_pagetable*)+0x1aa>
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   433df:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   433e3:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   433ea:	48 d3 e0             	shl    %cl,%rax
   433ed:	48 f7 d0             	not    %rax
   433f0:	48 23 45 e8          	and    -0x18(%rbp),%rax
   433f4:	48 01 d0             	add    %rdx,%rax
    assert(vmiter(pagetable, (uintptr_t) exception_entry).pa()
   433f7:	ba 72 0a 04 00       	mov    $0x40a72,%edx
   433fc:	48 39 c2             	cmp    %rax,%rdx
   433ff:	0f 85 26 01 00 00    	jne    4352b <check_pagetable(x86_64_pagetable*)+0x1bc>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   43405:	48 c7 45 d0 00 b0 05 	movq   $0x5b000,-0x30(%rbp)
   4340c:	00 
   4340d:	48 c7 45 d8 00 b0 05 	movq   $0x5b000,-0x28(%rbp)
   43414:	00 
   43415:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   4341c:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   43423:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   4342a:	00 
    real_find(va);
   4342b:	48 89 de             	mov    %rbx,%rsi
   4342e:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   43432:	e8 35 ec ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   43437:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4343b:	48 8b 08             	mov    (%rax),%rcx
   4343e:	f6 c1 01             	test   $0x1,%cl
   43441:	0f 84 0f 01 00 00    	je     43556 <check_pagetable(x86_64_pagetable*)+0x1e7>
        if (level_ > 0) {
   43447:	8b 45 e0             	mov    -0x20(%rbp),%eax
            pa &= ~0x1000UL;
   4344a:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   43451:	ff 0f 00 
   43454:	48 21 ca             	and    %rcx,%rdx
        if (level_ > 0) {
   43457:	85 c0                	test   %eax,%eax
   43459:	0f 8e e5 00 00 00    	jle    43544 <check_pagetable(x86_64_pagetable*)+0x1d5>
   4345f:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   43463:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   4346a:	48 d3 e0             	shl    %cl,%rax
   4346d:	48 f7 d0             	not    %rax
   43470:	48 23 45 e8          	and    -0x18(%rbp),%rax
   43474:	48 01 d0             	add    %rdx,%rax
    assert(vmiter(kernel_pagetable, (uintptr_t) pagetable).pa()
   43477:	48 39 c3             	cmp    %rax,%rbx
   4347a:	0f 85 d6 00 00 00    	jne    43556 <check_pagetable(x86_64_pagetable*)+0x1e7>
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   43480:	48 89 5d d0          	mov    %rbx,-0x30(%rbp)
   43484:	48 89 5d d8          	mov    %rbx,-0x28(%rbp)
   43488:	c7 45 e0 03 00 00 00 	movl   $0x3,-0x20(%rbp)
   4348f:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   43496:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   4349d:	00 
    real_find(va);
   4349e:	be 00 b0 05 00       	mov    $0x5b000,%esi
   434a3:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   434a7:	e8 c0 eb ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    if (*pep_ & PTE_P) {
   434ac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   434b0:	48 8b 08             	mov    (%rax),%rcx
   434b3:	f6 c1 01             	test   $0x1,%cl
   434b6:	0f 84 c5 00 00 00    	je     43581 <check_pagetable(x86_64_pagetable*)+0x212>
        if (level_ > 0) {
   434bc:	8b 45 e0             	mov    -0x20(%rbp),%eax
            pa &= ~0x1000UL;
   434bf:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   434c6:	ff 0f 00 
   434c9:	48 21 ca             	and    %rcx,%rdx
        if (level_ > 0) {
   434cc:	85 c0                	test   %eax,%eax
   434ce:	0f 8e 9b 00 00 00    	jle    4356f <check_pagetable(x86_64_pagetable*)+0x200>
   434d4:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   434d8:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   434df:	48 d3 e0             	shl    %cl,%rax
   434e2:	48 f7 d0             	not    %rax
   434e5:	48 23 45 e8          	and    -0x18(%rbp),%rax
   434e9:	48 01 d0             	add    %rdx,%rax
    assert(vmiter(pagetable, (uintptr_t) kernel_pagetable).pa()
   434ec:	ba 00 b0 05 00       	mov    $0x5b000,%edx
   434f1:	48 39 c2             	cmp    %rax,%rdx
   434f4:	0f 85 87 00 00 00    	jne    43581 <check_pagetable(x86_64_pagetable*)+0x212>
}
   434fa:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   434fe:	c9                   	leave
   434ff:	c3                   	ret
    assert(((uintptr_t) pagetable % PAGESIZE) == 0); // must be page aligned
   43500:	b9 00 00 00 00       	mov    $0x0,%ecx
   43505:	ba f8 5c 04 00       	mov    $0x45cf8,%edx
   4350a:	be 2e 01 00 00       	mov    $0x12e,%esi
   4350f:	bf 75 57 04 00       	mov    $0x45775,%edi
   43514:	e8 0b f9 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43519:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   43520:	ff 0f 00 
   43523:	48 21 ca             	and    %rcx,%rdx
   43526:	e9 b4 fe ff ff       	jmp    433df <check_pagetable(x86_64_pagetable*)+0x70>
    assert(vmiter(pagetable, (uintptr_t) exception_entry).pa()
   4352b:	b9 00 00 00 00       	mov    $0x0,%ecx
   43530:	ba 20 5d 04 00       	mov    $0x45d20,%edx
   43535:	be 2f 01 00 00       	mov    $0x12f,%esi
   4353a:	bf 75 57 04 00       	mov    $0x45775,%edi
   4353f:	e8 e0 f8 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
   43544:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   4354b:	ff 0f 00 
   4354e:	48 21 ca             	and    %rcx,%rdx
   43551:	e9 09 ff ff ff       	jmp    4345f <check_pagetable(x86_64_pagetable*)+0xf0>
    assert(vmiter(kernel_pagetable, (uintptr_t) pagetable).pa()
   43556:	b9 00 00 00 00       	mov    $0x0,%ecx
   4355b:	ba 70 5d 04 00       	mov    $0x45d70,%edx
   43560:	be 31 01 00 00       	mov    $0x131,%esi
   43565:	bf 75 57 04 00       	mov    $0x45775,%edi
   4356a:	e8 b5 f8 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
   4356f:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   43576:	ff 0f 00 
   43579:	48 21 ca             	and    %rcx,%rdx
   4357c:	e9 53 ff ff ff       	jmp    434d4 <check_pagetable(x86_64_pagetable*)+0x165>
    assert(vmiter(pagetable, (uintptr_t) kernel_pagetable).pa()
   43581:	b9 00 00 00 00       	mov    $0x0,%ecx
   43586:	ba c0 5d 04 00       	mov    $0x45dc0,%edx
   4358b:	be 33 01 00 00       	mov    $0x133,%esi
   43590:	bf 75 57 04 00       	mov    $0x45775,%edi
   43595:	e8 8a f8 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>

000000000004359a <pcistate::next(int) const>:
int pcistate::next(int addr) const {
   4359a:	f3 0f 1e fa          	endbr64
   4359e:	55                   	push   %rbp
   4359f:	48 89 e5             	mov    %rsp,%rbp
    }
    return addr;
}

inline uint32_t pcistate::readl(int addr) const {
    assert(addr >= 0 && !(addr & 3));
   435a2:	89 f0                	mov    %esi,%eax
   435a4:	83 c0 0c             	add    $0xc,%eax
   435a7:	78 23                	js     435cc <pcistate::next(int) const+0x32>
   435a9:	a8 03                	test   $0x3,%al
   435ab:	75 1f                	jne    435cc <pcistate::next(int) const+0x32>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   435ad:	0d 00 00 00 80       	or     $0x80000000,%eax
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   435b2:	ba f8 0c 00 00       	mov    $0xcf8,%edx
   435b7:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   435b8:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   435bd:	ed                   	in     (%dx),%eax
   435be:	89 c2                	mov    %eax,%edx
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   435c0:	bf f8 0c 00 00       	mov    $0xcf8,%edi
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   435c5:	b9 fc 0c 00 00       	mov    $0xcfc,%ecx
   435ca:	eb 5b                	jmp    43627 <pcistate::next(int) const+0x8d>
    assert(addr >= 0 && !(addr & 3));
   435cc:	b9 00 00 00 00       	mov    $0x0,%ecx
   435d1:	ba c0 57 04 00       	mov    $0x457c0,%edx
   435d6:	be 57 00 00 00       	mov    $0x57,%esi
   435db:	bf b7 57 04 00       	mov    $0x457b7,%edi
   435e0:	e8 3f f8 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
    assert(addr >= 0 && addr < 0x1000000);
   435e5:	b9 00 00 00 00       	mov    $0x0,%ecx
   435ea:	ba d9 57 04 00       	mov    $0x457d9,%edx
   435ef:	be 4a 00 00 00       	mov    $0x4a,%esi
   435f4:	bf b7 57 04 00       	mov    $0x457b7,%edi
   435f9:	e8 26 f8 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
            addr += make_addr(0, 0, 1);
   435fe:	81 c6 00 01 00 00    	add    $0x100,%esi
        if (addr >= addr_end) {
   43604:	81 fe ff ff 07 00    	cmp    $0x7ffff,%esi
   4360a:	7f 5d                	jg     43669 <pcistate::next(int) const+0xcf>
        x = readl(addr + config_lthb);
   4360c:	8d 46 0c             	lea    0xc(%rsi),%eax
    assert(addr >= 0 && !(addr & 3));
   4360f:	40 f6 c6 03          	test   $0x3,%sil
   43613:	75 37                	jne    4364c <pcistate::next(int) const+0xb2>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   43615:	0d 00 00 00 80       	or     $0x80000000,%eax
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   4361a:	89 fa                	mov    %edi,%edx
   4361c:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   4361d:	89 ca                	mov    %ecx,%edx
   4361f:	ed                   	in     (%dx),%eax
   43620:	89 c2                	mov    %eax,%edx
        if (x != uint32_t(-1)) {
   43622:	83 f8 ff             	cmp    $0xffffffff,%eax
   43625:	75 3e                	jne    43665 <pcistate::next(int) const+0xcb>
    assert(addr >= 0 && addr < 0x1000000);
   43627:	81 fe ff ff ff 00    	cmp    $0xffffff,%esi
   4362d:	77 b6                	ja     435e5 <pcistate::next(int) const+0x4b>
            && (x == uint32_t(-1) || !(x & 0x800000))) {
   4362f:	f7 c6 00 07 00 00    	test   $0x700,%esi
   43635:	75 c7                	jne    435fe <pcistate::next(int) const+0x64>
   43637:	83 fa ff             	cmp    $0xffffffff,%edx
   4363a:	74 08                	je     43644 <pcistate::next(int) const+0xaa>
   4363c:	f7 c2 00 00 80 00    	test   $0x800000,%edx
   43642:	75 ba                	jne    435fe <pcistate::next(int) const+0x64>
            addr += make_addr(0, 1, 0);
   43644:	81 c6 00 08 00 00    	add    $0x800,%esi
   4364a:	eb b8                	jmp    43604 <pcistate::next(int) const+0x6a>
    assert(addr >= 0 && !(addr & 3));
   4364c:	b9 00 00 00 00       	mov    $0x0,%ecx
   43651:	ba c0 57 04 00       	mov    $0x457c0,%edx
   43656:	be 57 00 00 00       	mov    $0x57,%esi
   4365b:	bf b7 57 04 00       	mov    $0x457b7,%edi
   43660:	e8 bf f7 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
            return addr;
   43665:	89 f0                	mov    %esi,%eax
   43667:	eb 05                	jmp    4366e <pcistate::next(int) const+0xd4>
            return -1;
   43669:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   4366e:	5d                   	pop    %rbp
   4366f:	c3                   	ret

0000000000043670 <poweroff()>:
void poweroff() {
   43670:	f3 0f 1e fa          	endbr64
   43674:	55                   	push   %rbp
   43675:	48 89 e5             	mov    %rsp,%rbp
   43678:	53                   	push   %rbx
   43679:	48 83 ec 08          	sub    $0x8,%rsp
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   4367d:	b8 00 00 00 80       	mov    $0x80000000,%eax
   43682:	ba f8 0c 00 00       	mov    $0xcf8,%edx
   43687:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   43688:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   4368d:	ed                   	in     (%dx),%eax
    while (addr >= 0 && !predicate(addr)) {
   4368e:	3d 86 80 13 71       	cmp    $0x71138086,%eax
   43693:	0f 84 bf 00 00 00    	je     43758 <poweroff()+0xe8>
   43699:	3d 86 80 18 29       	cmp    $0x29188086,%eax
   4369e:	0f 84 b4 00 00 00    	je     43758 <poweroff()+0xe8>
   436a4:	be 00 00 00 00       	mov    $0x0,%esi
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   436a9:	bb f8 0c 00 00       	mov    $0xcf8,%ebx
        addr = next(addr);
   436ae:	bf 00 00 06 00       	mov    $0x60000,%edi
   436b3:	e8 e2 fe ff ff       	call   4359a <pcistate::next(int) const>
   436b8:	89 c6                	mov    %eax,%esi
    while (addr >= 0 && !predicate(addr)) {
   436ba:	85 c0                	test   %eax,%eax
   436bc:	78 4d                	js     4370b <poweroff()+0x9b>
    assert(addr >= 0 && !(addr & 3));
   436be:	40 f6 c6 03          	test   $0x3,%sil
   436c2:	75 62                	jne    43726 <poweroff()+0xb6>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   436c4:	89 f0                	mov    %esi,%eax
   436c6:	0d 00 00 00 80       	or     $0x80000000,%eax
   436cb:	89 da                	mov    %ebx,%edx
   436cd:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   436ce:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   436d3:	ed                   	in     (%dx),%eax
    while (addr >= 0 && !predicate(addr)) {
   436d4:	3d 86 80 13 71       	cmp    $0x71138086,%eax
   436d9:	74 07                	je     436e2 <poweroff()+0x72>
   436db:	3d 86 80 18 29       	cmp    $0x29188086,%eax
   436e0:	75 cc                	jne    436ae <poweroff()+0x3e>
        int pm_io_base = pci.readl(addr + 0x40) & 0xFFC0;
   436e2:	8d 46 40             	lea    0x40(%rsi),%eax
    assert(addr >= 0 && !(addr & 3));
   436e5:	40 f6 c6 03          	test   $0x3,%sil
   436e9:	75 54                	jne    4373f <poweroff()+0xcf>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   436eb:	0d 00 00 00 80       	or     $0x80000000,%eax
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   436f0:	ba f8 0c 00 00       	mov    $0xcf8,%edx
   436f5:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   436f6:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   436fb:	ed                   	in     (%dx),%eax
   436fc:	25 c0 ff 00 00       	and    $0xffc0,%eax
        outw(pm_io_base + 4, 0x2000);
   43701:	8d 50 04             	lea    0x4(%rax),%edx
    asm volatile("outw %0, %w1" : : "a" (data), "d" (port));
   43704:	b8 00 20 00 00       	mov    $0x2000,%eax
   43709:	66 ef                	out    %ax,(%dx)
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   4370b:	ba f7 57 04 00       	mov    $0x457f7,%edx
   43710:	be 00 c0 00 00       	mov    $0xc000,%esi
   43715:	bf 80 07 00 00       	mov    $0x780,%edi
   4371a:	b8 00 00 00 00       	mov    $0x0,%eax
   4371f:	e8 5b 1d 00 00       	call   4547f <console_printf(int, int, char const*, ...)>
    while (true) {
   43724:	eb fe                	jmp    43724 <poweroff()+0xb4>
    assert(addr >= 0 && !(addr & 3));
   43726:	b9 00 00 00 00       	mov    $0x0,%ecx
   4372b:	ba c0 57 04 00       	mov    $0x457c0,%edx
   43730:	be 57 00 00 00       	mov    $0x57,%esi
   43735:	bf b7 57 04 00       	mov    $0x457b7,%edi
   4373a:	e8 e5 f6 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
   4373f:	b9 00 00 00 00       	mov    $0x0,%ecx
   43744:	ba c0 57 04 00       	mov    $0x457c0,%edx
   43749:	be 57 00 00 00       	mov    $0x57,%esi
   4374e:	bf b7 57 04 00       	mov    $0x457b7,%edi
   43753:	e8 cc f6 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
        int pm_io_base = pci.readl(addr + 0x40) & 0xFFC0;
   43758:	b8 40 00 00 00       	mov    $0x40,%eax
   4375d:	eb 8c                	jmp    436eb <poweroff()+0x7b>

000000000004375f <check_keyboard()>:
int check_keyboard() {
   4375f:	f3 0f 1e fa          	endbr64
   43763:	55                   	push   %rbp
   43764:	48 89 e5             	mov    %rsp,%rbp
   43767:	41 54                	push   %r12
   43769:	53                   	push   %rbx
   4376a:	48 83 ec 20          	sub    $0x20,%rsp
    int c = keyboard_readc();
   4376e:	e8 1a f0 ff ff       	call   4278d <keyboard_readc()>
   43773:	41 89 c4             	mov    %eax,%r12d
    if (c == 'a' || c == 'f' || c == 'e') {
   43776:	8d 40 9b             	lea    -0x65(%rax),%eax
   43779:	83 f8 01             	cmp    $0x1,%eax
   4377c:	76 1b                	jbe    43799 <check_keyboard()+0x3a>
   4377e:	41 83 fc 61          	cmp    $0x61,%r12d
   43782:	74 15                	je     43799 <check_keyboard()+0x3a>
    } else if (c == 0x03 || c == 'q') {
   43784:	41 83 fc 03          	cmp    $0x3,%r12d
   43788:	74 0a                	je     43794 <check_keyboard()+0x35>
   4378a:	41 83 fc 71          	cmp    $0x71,%r12d
   4378e:	0f 85 cc 00 00 00    	jne    43860 <check_keyboard()+0x101>
        poweroff();
   43794:	e8 d7 fe ff ff       	call   43670 <poweroff()>
   43799:	b8 80 03 e0 fe       	mov    $0xfee00380,%eax
   4379e:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
        memset(pt, 0, PAGESIZE * 2);
   437a4:	ba 00 20 00 00       	mov    $0x2000,%edx
   437a9:	be 00 00 00 00       	mov    $0x0,%esi
   437ae:	bf 00 10 00 00       	mov    $0x1000,%edi
   437b3:	e8 88 10 00 00       	call   44840 <memset>
        pt[0].entry[0] = 0x2000 | PTE_P | PTE_W;
   437b8:	48 c7 04 25 00 10 00 	movq   $0x2003,0x1000
   437bf:	00 03 20 00 00 
        pt[1].entry[0] = PTE_P | PTE_W | PTE_PS;
   437c4:	48 c7 04 25 00 20 00 	movq   $0x83,0x2000
   437cb:	00 83 00 00 00 
    asm volatile("movq %0, %%cr3" : : "r" (x) : "memory");
   437d0:	b8 00 10 00 00       	mov    $0x1000,%eax
   437d5:	0f 22 d8             	mov    %rax,%cr3
        multiboot_info[0] = 4;
   437d8:	c7 45 dc 04 00 00 00 	movl   $0x4,-0x24(%rbp)
            argument = "allocators";
   437df:	b8 0a 58 04 00       	mov    $0x4580a,%eax
        if (c == 'a') {
   437e4:	41 83 fc 61          	cmp    $0x61,%r12d
   437e8:	74 12                	je     437fc <check_keyboard()+0x9d>
        const char* argument = "fork";
   437ea:	41 83 fc 65          	cmp    $0x65,%r12d
   437ee:	b8 15 58 04 00       	mov    $0x45815,%eax
   437f3:	ba fa 55 04 00       	mov    $0x455fa,%edx
   437f8:	48 0f 45 c2          	cmovne %rdx,%rax
        assert(argument_ptr < 0x100000000L);
   437fc:	48 89 c1             	mov    %rax,%rcx
   437ff:	48 c1 e9 20          	shr    $0x20,%rcx
   43803:	75 67                	jne    4386c <check_keyboard()+0x10d>
        multiboot_info[4] = (uint32_t) argument_ptr;
   43805:	89 45 ec             	mov    %eax,-0x14(%rbp)
        stash_kernel_data(true);
   43808:	bf 01 00 00 00       	mov    $0x1,%edi
   4380d:	e8 a7 ed ff ff       	call   425b9 <stash_kernel_data(bool)>
        uintptr_t zero_size = (uintptr_t) _kernel_end - (uintptr_t) _edata;
   43812:	bb b0 01 06 00       	mov    $0x601b0,%ebx
   43817:	48 81 eb a0 81 05 00 	sub    $0x581a0,%rbx
        uintptr_t data_size = (uintptr_t) _edata - (uintptr_t) _data_start;
   4381e:	ba a0 81 05 00       	mov    $0x581a0,%edx
   43823:	48 81 ea 00 70 04 00 	sub    $0x47000,%rdx
        uint8_t* data_stash = (uint8_t*) (SYMTAB_ADDR - data_size);
   4382a:	be 00 70 04 01       	mov    $0x1047000,%esi
   4382f:	48 81 ee a0 81 05 00 	sub    $0x581a0,%rsi
        memcpy(_data_start, data_stash, data_size);
   43836:	bf 00 70 04 00       	mov    $0x47000,%edi
   4383b:	e8 dc 0f 00 00       	call   4481c <memcpy>
        memset(_edata, 0, zero_size);
   43840:	48 89 da             	mov    %rbx,%rdx
   43843:	be 00 00 00 00       	mov    $0x0,%esi
   43848:	bf a0 81 05 00       	mov    $0x581a0,%edi
   4384d:	e8 ee 0f 00 00       	call   44840 <memset>
        asm volatile("movl $0x2BADB002, %%eax; jmp kernel_entry"
   43852:	48 8d 5d dc          	lea    -0x24(%rbp),%rbx
   43856:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   4385b:	e9 a0 c7 ff ff       	jmp    40000 <_kernel_start>
}
   43860:	44 89 e0             	mov    %r12d,%eax
   43863:	48 83 c4 20          	add    $0x20,%rsp
   43867:	5b                   	pop    %rbx
   43868:	41 5c                	pop    %r12
   4386a:	5d                   	pop    %rbp
   4386b:	c3                   	ret
        assert(argument_ptr < 0x100000000L);
   4386c:	b9 00 00 00 00       	mov    $0x0,%ecx
   43871:	ba 1a 58 04 00       	mov    $0x4581a,%edx
   43876:	be 29 03 00 00       	mov    $0x329,%esi
   4387b:	bf 75 57 04 00       	mov    $0x45775,%edi
   43880:	e8 9f f5 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>

0000000000043885 <user_panic(proc const*)>:
void user_panic(const proc* p) {
   43885:	f3 0f 1e fa          	endbr64
   43889:	55                   	push   %rbp
   4388a:	48 89 e5             	mov    %rsp,%rbp
   4388d:	53                   	push   %rbx
   4388e:	48 81 ec 28 01 00 00 	sub    $0x128,%rsp
   43895:	48 89 fb             	mov    %rdi,%rbx
	__always_inline void store(T i, memory_order m = memory_order::seq_cst) noexcept { __atomic_store_n(&_value, i, int(m)); }
   43898:	b8 01 00 00 00       	mov    $0x1,%eax
   4389d:	86 05 65 67 01 00    	xchg   %al,0x16765(%rip)        # 5a008 <panicking>
    cursorpos = CPOS(24, 80);
   438a3:	c7 05 4f 57 07 00 d0 	movl   $0x7d0,0x7574f(%rip)        # b8ffc <cursorpos>
   438aa:	07 00 00 
    memset(buf, 0, sizeof(buf));
   438ad:	ba 00 01 00 00       	mov    $0x100,%edx
   438b2:	be 00 00 00 00       	mov    $0x0,%esi
   438b7:	48 8d bd f0 fe ff ff 	lea    -0x110(%rbp),%rdi
   438be:	e8 7d 0f 00 00       	call   44840 <memset>
    if (p->regs.reg_rdi == 0) {
   438c3:	48 8b 73 40          	mov    0x40(%rbx),%rsi
   438c7:	48 85 f6             	test   %rsi,%rsi
   438ca:	0f 84 a1 00 00 00    	je     43971 <user_panic(proc const*)+0xec>
    : vmiter(p->pagetable, va) {
   438d0:	48 8b 03             	mov    (%rbx),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   438d3:	48 89 85 d0 fe ff ff 	mov    %rax,-0x130(%rbp)
   438da:	48 89 85 d8 fe ff ff 	mov    %rax,-0x128(%rbp)
   438e1:	c7 85 e0 fe ff ff 03 	movl   $0x3,-0x120(%rbp)
   438e8:	00 00 00 
   438eb:	c7 85 e4 fe ff ff ff 	movl   $0xfff,-0x11c(%rbp)
   438f2:	0f 00 00 
   438f5:	48 c7 85 e8 fe ff ff 	movq   $0x0,-0x118(%rbp)
   438fc:	00 00 00 00 
    real_find(va);
   43900:	48 8d bd d0 fe ff ff 	lea    -0x130(%rbp),%rdi
   43907:	e8 60 e7 ff ff       	call   4206c <vmiter::real_find(unsigned long)>
        strlcpy_from_user(buf, vmiter(p, p->regs.reg_rdi), sizeof(buf));
   4390c:	ff b5 e8 fe ff ff    	push   -0x118(%rbp)
   43912:	ff b5 e0 fe ff ff    	push   -0x120(%rbp)
   43918:	ff b5 d8 fe ff ff    	push   -0x128(%rbp)
   4391e:	ff b5 d0 fe ff ff    	push   -0x130(%rbp)
   43924:	be 00 01 00 00       	mov    $0x100,%esi
   43929:	48 8d bd f0 fe ff ff 	lea    -0x110(%rbp),%rdi
   43930:	e8 0a f4 ff ff       	call   42d3f <strlcpy_from_user(char*, vmiter, unsigned long)>
   43935:	48 83 c4 20          	add    $0x20,%rsp
        fmt = "USER PANIC: %s";
   43939:	ba 41 58 04 00       	mov    $0x45841,%edx
    error_printf(-1, COLOR_ERROR, fmt, buf);
   4393e:	48 8d 8d f0 fe ff ff 	lea    -0x110(%rbp),%rcx
   43945:	be 00 c0 00 00       	mov    $0xc000,%esi
   4394a:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   4394f:	b8 00 00 00 00       	mov    $0x0,%eax
   43954:	e8 60 1b 00 00       	call   454b9 <error_printf(int, int, char const*, ...)>
    error_print_backtrace(p->regs, p->pagetable, true);
   43959:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   4395d:	ba 01 00 00 00       	mov    $0x1,%edx
   43962:	48 8b 33             	mov    (%rbx),%rsi
   43965:	e8 a1 f0 ff ff       	call   42a0b <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)>
        check_keyboard();
   4396a:	e8 f0 fd ff ff       	call   4375f <check_keyboard()>
    while (true) {
   4396f:	eb f9                	jmp    4396a <user_panic(proc const*)+0xe5>
        fmt = "USER PANIC";
   43971:	ba 36 58 04 00       	mov    $0x45836,%edx
   43976:	eb c6                	jmp    4393e <user_panic(proc const*)+0xb9>

0000000000043978 <proc_panic(proc const*, char const*, ...)>:
void proc_panic(const proc* p, const char* format, ...) {
   43978:	f3 0f 1e fa          	endbr64
   4397c:	55                   	push   %rbp
   4397d:	48 89 e5             	mov    %rsp,%rbp
   43980:	53                   	push   %rbx
   43981:	48 83 ec 58          	sub    $0x58,%rsp
   43985:	48 89 fb             	mov    %rdi,%rbx
   43988:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   4398c:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
   43990:	4c 89 45 e0          	mov    %r8,-0x20(%rbp)
   43994:	4c 89 4d e8          	mov    %r9,-0x18(%rbp)
   43998:	b0 01                	mov    $0x1,%al
   4399a:	86 05 68 66 01 00    	xchg   %al,0x16668(%rip)        # 5a008 <panicking>
    cursorpos = CPOS(24, 80);
   439a0:	c7 05 52 56 07 00 d0 	movl   $0x7d0,0x75652(%rip)        # b8ffc <cursorpos>
   439a7:	07 00 00 
    va_start(val, format);
   439aa:	c7 45 a8 10 00 00 00 	movl   $0x10,-0x58(%rbp)
   439b1:	48 8d 45 10          	lea    0x10(%rbp),%rax
   439b5:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   439b9:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   439bd:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    error_vprintf(-1, COLOR_ERROR, format, val);
   439c1:	48 8d 4d a8          	lea    -0x58(%rbp),%rcx
   439c5:	48 89 f2             	mov    %rsi,%rdx
   439c8:	be 00 c0 00 00       	mov    $0xc000,%esi
   439cd:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   439d2:	e8 0f f3 ff ff       	call   42ce6 <error_vprintf(int, int, char const*, __va_list_tag*)>
    if ((p->regs.reg_cs & 3) == 0) {
   439d7:	f6 83 b0 00 00 00 03 	testb  $0x3,0xb0(%rbx)
   439de:	75 18                	jne    439f8 <proc_panic(proc const*, char const*, ...)+0x80>
    asm volatile("movq %%cr3, %0" : "=r" (x));
   439e0:	0f 20 de             	mov    %cr3,%rsi
    error_print_backtrace(p->regs, pt, true);
   439e3:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   439e7:	ba 01 00 00 00       	mov    $0x1,%edx
   439ec:	e8 1a f0 ff ff       	call   42a0b <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)>
        check_keyboard();
   439f1:	e8 69 fd ff ff       	call   4375f <check_keyboard()>
    while (true) {
   439f6:	eb f9                	jmp    439f1 <proc_panic(proc const*, char const*, ...)+0x79>
        pt = p->pagetable;
   439f8:	48 8b 33             	mov    (%rbx),%rsi
   439fb:	eb e6                	jmp    439e3 <proc_panic(proc const*, char const*, ...)+0x6b>

00000000000439fd <panic(char const*, ...)>:
void panic(const char* format, ...) {
   439fd:	f3 0f 1e fa          	endbr64
   43a01:	55                   	push   %rbp
   43a02:	48 89 e5             	mov    %rsp,%rbp
   43a05:	53                   	push   %rbx
   43a06:	48 83 ec 58          	sub    $0x58,%rsp
   43a0a:	48 89 fb             	mov    %rdi,%rbx
   43a0d:	48 89 75 c8          	mov    %rsi,-0x38(%rbp)
   43a11:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   43a15:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
   43a19:	4c 89 45 e0          	mov    %r8,-0x20(%rbp)
   43a1d:	4c 89 4d e8          	mov    %r9,-0x18(%rbp)
   43a21:	b0 01                	mov    $0x1,%al
   43a23:	86 05 df 65 01 00    	xchg   %al,0x165df(%rip)        # 5a008 <panicking>
    cursorpos = CPOS(24, 80);
   43a29:	c7 05 c9 55 07 00 d0 	movl   $0x7d0,0x755c9(%rip)        # b8ffc <cursorpos>
   43a30:	07 00 00 
    if (!format) {
   43a33:	48 85 ff             	test   %rdi,%rdi
   43a36:	75 05                	jne    43a3d <panic(char const*, ...)+0x40>
        format = "PANIC";
   43a38:	bb 3b 58 04 00       	mov    $0x4583b,%ebx
    if (strstr(format, "PANIC") == nullptr) {
   43a3d:	be 3b 58 04 00       	mov    $0x4583b,%esi
   43a42:	48 89 df             	mov    %rbx,%rdi
   43a45:	e8 d8 0e 00 00       	call   44922 <strstr>
   43a4a:	48 85 c0             	test   %rax,%rax
   43a4d:	75 14                	jne    43a63 <panic(char const*, ...)+0x66>
        error_printf(-1, COLOR_ERROR, "PANIC: ");
   43a4f:	ba 50 58 04 00       	mov    $0x45850,%edx
   43a54:	be 00 c0 00 00       	mov    $0xc000,%esi
   43a59:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   43a5e:	e8 56 1a 00 00       	call   454b9 <error_printf(int, int, char const*, ...)>
    va_start(val, format);
   43a63:	c7 45 a8 08 00 00 00 	movl   $0x8,-0x58(%rbp)
   43a6a:	48 8d 45 10          	lea    0x10(%rbp),%rax
   43a6e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   43a72:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
   43a76:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    error_vprintf(-1, COLOR_ERROR, format, val);
   43a7a:	48 8d 4d a8          	lea    -0x58(%rbp),%rcx
   43a7e:	48 89 da             	mov    %rbx,%rdx
   43a81:	be 00 c0 00 00       	mov    $0xc000,%esi
   43a86:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   43a8b:	e8 56 f2 ff ff       	call   42ce6 <error_vprintf(int, int, char const*, __va_list_tag*)>
   43a90:	0f 20 de             	mov    %cr3,%rsi
    asm volatile("movq %%rsp, %0" : "=r" (x));
   43a93:	48 89 e0             	mov    %rsp,%rax
    backtrace_kernel_regs.reg_rsp = rdrsp();
   43a96:	48 89 05 f3 c6 01 00 	mov    %rax,0x1c6f3(%rip)        # 60190 <backtrace_current_regs()::backtrace_kernel_regs+0xb0>
    asm volatile("movq %%rbp, %0" : "=r" (x));
   43a9d:	48 89 e8             	mov    %rbp,%rax
    backtrace_kernel_regs.reg_rbp = rdrbp();
   43aa0:	48 89 05 59 c6 01 00 	mov    %rax,0x1c659(%rip)        # 60100 <backtrace_current_regs()::backtrace_kernel_regs+0x20>
    backtrace_kernel_regs.reg_rip = 0;
   43aa7:	48 c7 05 c6 c6 01 00 	movq   $0x0,0x1c6c6(%rip)        # 60178 <backtrace_current_regs()::backtrace_kernel_regs+0x98>
   43aae:	00 00 00 00 
    error_print_backtrace(backtrace_current_regs(), backtrace_current_pagetable(), false);
   43ab2:	ba 00 00 00 00       	mov    $0x0,%edx
   43ab7:	bf e0 00 06 00       	mov    $0x600e0,%edi
   43abc:	e8 4a ef ff ff       	call   42a0b <error_print_backtrace(regstate const&, x86_64_pagetable*, bool)>
        check_keyboard();
   43ac1:	e8 99 fc ff ff       	call   4375f <check_keyboard()>
    while (true) {
   43ac6:	eb f9                	jmp    43ac1 <panic(char const*, ...)+0xc4>

0000000000043ac8 <program_image::program_image(int)>:
program_image::program_image(int program_number) {
   43ac8:	f3 0f 1e fa          	endbr64
    elf_ = nullptr;
   43acc:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
    if (program_number >= 0
   43ad3:	83 fe 05             	cmp    $0x5,%esi
   43ad6:	77 1a                	ja     43af2 <program_image::program_image(int)+0x2a>
        elf_ = (elf_header*) ramimages[program_number].begin;
   43ad8:	48 63 f6             	movslq %esi,%rsi
   43adb:	48 8d 04 76          	lea    (%rsi,%rsi,2),%rax
   43adf:	48 8b 04 c5 08 70 04 	mov    0x47008(,%rax,8),%rax
   43ae6:	00 
   43ae7:	48 89 07             	mov    %rax,(%rdi)
        assert(elf_->e_magic == ELF_MAGIC);
   43aea:	81 38 7f 45 4c 46    	cmpl   $0x464c457f,(%rax)
   43af0:	75 01                	jne    43af3 <program_image::program_image(int)+0x2b>
   43af2:	c3                   	ret
program_image::program_image(int program_number) {
   43af3:	55                   	push   %rbp
   43af4:	48 89 e5             	mov    %rsp,%rbp
        assert(elf_->e_magic == ELF_MAGIC);
   43af7:	b9 00 00 00 00       	mov    $0x0,%ecx
   43afc:	ba 58 58 04 00       	mov    $0x45858,%edx
   43b01:	be d6 03 00 00       	mov    $0x3d6,%esi
   43b06:	bf 75 57 04 00       	mov    $0x45775,%edi
   43b0b:	e8 14 f3 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>

0000000000043b10 <program_image::program_number(char const*)>:
int program_image::program_number(const char* program_name) {
   43b10:	f3 0f 1e fa          	endbr64
   43b14:	55                   	push   %rbp
   43b15:	48 89 e5             	mov    %rsp,%rbp
   43b18:	41 54                	push   %r12
   43b1a:	53                   	push   %rbx
   43b1b:	49 89 fc             	mov    %rdi,%r12
    for (size_t i = 0; i != sizeof(ramimages) / sizeof(ramimages[0]); ++i) {
   43b1e:	bb 00 00 00 00       	mov    $0x0,%ebx
        if (strcmp(program_name, ramimages[i].name) == 0) {
   43b23:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
   43b27:	48 8b 34 c5 00 70 04 	mov    0x47000(,%rax,8),%rsi
   43b2e:	00 
   43b2f:	4c 89 e7             	mov    %r12,%rdi
   43b32:	e8 6d 0d 00 00       	call   448a4 <strcmp>
   43b37:	85 c0                	test   %eax,%eax
   43b39:	74 14                	je     43b4f <program_image::program_number(char const*)+0x3f>
    for (size_t i = 0; i != sizeof(ramimages) / sizeof(ramimages[0]); ++i) {
   43b3b:	48 83 c3 01          	add    $0x1,%rbx
   43b3f:	48 83 fb 06          	cmp    $0x6,%rbx
   43b43:	75 de                	jne    43b23 <program_image::program_number(char const*)+0x13>
    return -1;
   43b45:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   43b4a:	5b                   	pop    %rbx
   43b4b:	41 5c                	pop    %r12
   43b4d:	5d                   	pop    %rbp
   43b4e:	c3                   	ret
            return i;
   43b4f:	89 d8                	mov    %ebx,%eax
   43b51:	eb f7                	jmp    43b4a <program_image::program_number(char const*)+0x3a>
   43b53:	90                   	nop

0000000000043b54 <program_image::program_image(char const*)>:
program_image::program_image(const char* program_name)
   43b54:	f3 0f 1e fa          	endbr64
   43b58:	55                   	push   %rbp
   43b59:	48 89 e5             	mov    %rsp,%rbp
   43b5c:	53                   	push   %rbx
   43b5d:	48 83 ec 08          	sub    $0x8,%rsp
   43b61:	48 89 fb             	mov    %rdi,%rbx
   43b64:	48 89 f7             	mov    %rsi,%rdi
    : program_image(program_number(program_name)) {
   43b67:	e8 a4 ff ff ff       	call   43b10 <program_image::program_number(char const*)>
   43b6c:	89 c6                	mov    %eax,%esi
   43b6e:	48 89 df             	mov    %rbx,%rdi
   43b71:	e8 52 ff ff ff       	call   43ac8 <program_image::program_image(int)>
}
   43b76:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   43b7a:	c9                   	leave
   43b7b:	c3                   	ret

0000000000043b7c <program_image::entry() const>:
uintptr_t program_image::entry() const {
   43b7c:	f3 0f 1e fa          	endbr64
    return elf_ ? elf_->e_entry : 0;
   43b80:	48 8b 17             	mov    (%rdi),%rdx
   43b83:	b8 00 00 00 00       	mov    $0x0,%eax
   43b88:	48 85 d2             	test   %rdx,%rdx
   43b8b:	74 04                	je     43b91 <program_image::entry() const+0x15>
   43b8d:	48 8b 42 18          	mov    0x18(%rdx),%rax
}
   43b91:	c3                   	ret

0000000000043b92 <program_image::empty() const>:
bool program_image::empty() const {
   43b92:	f3 0f 1e fa          	endbr64
    return !elf_ || elf_->e_phnum == 0;
   43b96:	48 8b 17             	mov    (%rdi),%rdx
   43b99:	b8 01 00 00 00       	mov    $0x1,%eax
   43b9e:	48 85 d2             	test   %rdx,%rdx
   43ba1:	74 08                	je     43bab <program_image::empty() const+0x19>
   43ba3:	66 83 7a 38 00       	cmpw   $0x0,0x38(%rdx)
   43ba8:	0f 94 c0             	sete   %al
}
   43bab:	c3                   	ret

0000000000043bac <program_image_segment::program_image_segment(elf_program*, elf_header*)>:
program_image_segment::program_image_segment(elf_program* ph, elf_header* elf)
   43bac:	f3 0f 1e fa          	endbr64
    : ph_(ph), elf_(elf) {
   43bb0:	48 89 37             	mov    %rsi,(%rdi)
   43bb3:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    if (elf) {
   43bb7:	48 85 d2             	test   %rdx,%rdx
   43bba:	74 1a                	je     43bd6 <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x2a>
        return ph + (end ? elf->e_phnum : 0);
   43bbc:	0f b7 4a 38          	movzwl 0x38(%rdx),%ecx
   43bc0:	48 8d 04 cd 00 00 00 	lea    0x0(,%rcx,8),%rax
   43bc7:	00 
   43bc8:	48 29 c8             	sub    %rcx,%rax
   43bcb:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
   43bcf:	48 03 42 20          	add    0x20(%rdx),%rax
   43bd3:	48 89 c2             	mov    %rax,%rdx
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   43bd6:	48 39 d6             	cmp    %rdx,%rsi
   43bd9:	74 12                	je     43bed <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x41>
   43bdb:	83 3e 01             	cmpl   $0x1,(%rsi)
   43bde:	74 0c                	je     43bec <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x40>
        ++ph_;
   43be0:	48 83 c6 38          	add    $0x38,%rsi
   43be4:	48 89 37             	mov    %rsi,(%rdi)
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   43be7:	48 39 d6             	cmp    %rdx,%rsi
   43bea:	75 ef                	jne    43bdb <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x2f>
}
   43bec:	c3                   	ret
   43bed:	c3                   	ret

0000000000043bee <program_image::begin() const>:
program_image_segment program_image::begin() const {
   43bee:	f3 0f 1e fa          	endbr64
   43bf2:	55                   	push   %rbp
   43bf3:	48 89 e5             	mov    %rsp,%rbp
   43bf6:	48 83 ec 10          	sub    $0x10,%rsp
    return program_image_segment(elf_header_program(elf_, false), elf_);
   43bfa:	48 8b 17             	mov    (%rdi),%rdx
    if (elf) {
   43bfd:	48 85 d2             	test   %rdx,%rdx
   43c00:	74 1a                	je     43c1c <program_image::begin() const+0x2e>
        return ph + (end ? elf->e_phnum : 0);
   43c02:	48 89 d6             	mov    %rdx,%rsi
   43c05:	48 03 72 20          	add    0x20(%rdx),%rsi
    return program_image_segment(elf_header_program(elf_, false), elf_);
   43c09:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   43c0d:	e8 9a ff ff ff       	call   43bac <program_image_segment::program_image_segment(elf_program*, elf_header*)>
}
   43c12:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43c16:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43c1a:	c9                   	leave
   43c1b:	c3                   	ret
        return nullptr;
   43c1c:	48 89 d6             	mov    %rdx,%rsi
   43c1f:	eb e8                	jmp    43c09 <program_image::begin() const+0x1b>
   43c21:	90                   	nop

0000000000043c22 <program_image::end() const>:
program_image_segment program_image::end() const {
   43c22:	f3 0f 1e fa          	endbr64
   43c26:	55                   	push   %rbp
   43c27:	48 89 e5             	mov    %rsp,%rbp
   43c2a:	48 83 ec 10          	sub    $0x10,%rsp
    return program_image_segment(elf_header_program(elf_, true), elf_);
   43c2e:	48 8b 17             	mov    (%rdi),%rdx
    if (elf) {
   43c31:	48 85 d2             	test   %rdx,%rdx
   43c34:	74 2a                	je     43c60 <program_image::end() const+0x3e>
        return ph + (end ? elf->e_phnum : 0);
   43c36:	0f b7 4a 38          	movzwl 0x38(%rdx),%ecx
   43c3a:	48 8d 04 cd 00 00 00 	lea    0x0(,%rcx,8),%rax
   43c41:	00 
   43c42:	48 29 c8             	sub    %rcx,%rax
   43c45:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   43c49:	48 03 72 20          	add    0x20(%rdx),%rsi
    return program_image_segment(elf_header_program(elf_, true), elf_);
   43c4d:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   43c51:	e8 56 ff ff ff       	call   43bac <program_image_segment::program_image_segment(elf_program*, elf_header*)>
}
   43c56:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   43c5a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   43c5e:	c9                   	leave
   43c5f:	c3                   	ret
        return nullptr;
   43c60:	48 89 d6             	mov    %rdx,%rsi
   43c63:	eb e8                	jmp    43c4d <program_image::end() const+0x2b>
   43c65:	90                   	nop

0000000000043c66 <program_image_segment::va() const>:
uintptr_t program_image_segment::va() const {
   43c66:	f3 0f 1e fa          	endbr64
    return ph_->p_va;
   43c6a:	48 8b 07             	mov    (%rdi),%rax
   43c6d:	48 8b 40 10          	mov    0x10(%rax),%rax
}
   43c71:	c3                   	ret

0000000000043c72 <program_image_segment::size() const>:
size_t program_image_segment::size() const {
   43c72:	f3 0f 1e fa          	endbr64
    return ph_->p_memsz;
   43c76:	48 8b 07             	mov    (%rdi),%rax
   43c79:	48 8b 40 28          	mov    0x28(%rax),%rax
}
   43c7d:	c3                   	ret

0000000000043c7e <program_image_segment::data() const>:
const char* program_image_segment::data() const {
   43c7e:	f3 0f 1e fa          	endbr64
    return (const char*) elf_ + ph_->p_offset;
   43c82:	48 8b 07             	mov    (%rdi),%rax
   43c85:	48 8b 40 08          	mov    0x8(%rax),%rax
   43c89:	48 03 47 08          	add    0x8(%rdi),%rax
}
   43c8d:	c3                   	ret

0000000000043c8e <program_image_segment::data_size() const>:
size_t program_image_segment::data_size() const {
   43c8e:	f3 0f 1e fa          	endbr64
    return ph_->p_filesz;
   43c92:	48 8b 07             	mov    (%rdi),%rax
   43c95:	48 8b 40 20          	mov    0x20(%rax),%rax
}
   43c99:	c3                   	ret

0000000000043c9a <program_image_segment::writable() const>:
bool program_image_segment::writable() const {
   43c9a:	f3 0f 1e fa          	endbr64
    return ph_->p_flags & ELF_PFLAG_WRITE;
   43c9e:	48 8b 07             	mov    (%rdi),%rax
   43ca1:	8b 40 04             	mov    0x4(%rax),%eax
   43ca4:	d1 e8                	shr    $1,%eax
   43ca6:	83 e0 01             	and    $0x1,%eax
}
   43ca9:	c3                   	ret

0000000000043caa <program_image_segment::operator!=(program_image_segment const&) const>:
bool program_image_segment::operator!=(const program_image_segment& x) const {
   43caa:	f3 0f 1e fa          	endbr64
    return ph_ != x.ph_;
   43cae:	48 8b 06             	mov    (%rsi),%rax
   43cb1:	48 39 07             	cmp    %rax,(%rdi)
   43cb4:	0f 95 c0             	setne  %al
}
   43cb7:	c3                   	ret

0000000000043cb8 <program_image_segment::operator++()>:
void program_image_segment::operator++() {
   43cb8:	f3 0f 1e fa          	endbr64
    assert(ph_ != elf_header_program(elf_, true));
   43cbc:	48 8b 07             	mov    (%rdi),%rax
   43cbf:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    if (elf) {
   43cc3:	48 85 d2             	test   %rdx,%rdx
   43cc6:	74 73                	je     43d3b <program_image_segment::operator++()+0x83>
        return ph + (end ? elf->e_phnum : 0);
   43cc8:	0f b7 72 38          	movzwl 0x38(%rdx),%esi
   43ccc:	48 8d 0c f5 00 00 00 	lea    0x0(,%rsi,8),%rcx
   43cd3:	00 
   43cd4:	48 29 f1             	sub    %rsi,%rcx
   43cd7:	48 8d 0c ca          	lea    (%rdx,%rcx,8),%rcx
   43cdb:	48 03 4a 20          	add    0x20(%rdx),%rcx
    assert(ph_ != elf_header_program(elf_, true));
   43cdf:	48 39 c8             	cmp    %rcx,%rax
   43ce2:	74 38                	je     43d1c <program_image_segment::operator++()+0x64>
    ++ph_;
   43ce4:	48 83 c0 38          	add    $0x38,%rax
   43ce8:	48 89 07             	mov    %rax,(%rdi)
        return ph + (end ? elf->e_phnum : 0);
   43ceb:	0f b7 72 38          	movzwl 0x38(%rdx),%esi
   43cef:	48 8d 0c f5 00 00 00 	lea    0x0(,%rsi,8),%rcx
   43cf6:	00 
   43cf7:	48 29 f1             	sub    %rsi,%rcx
   43cfa:	48 8d 0c ca          	lea    (%rdx,%rcx,8),%rcx
   43cfe:	48 03 4a 20          	add    0x20(%rdx),%rcx
   43d02:	48 89 ca             	mov    %rcx,%rdx
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   43d05:	48 39 c1             	cmp    %rax,%rcx
   43d08:	74 30                	je     43d3a <program_image_segment::operator++()+0x82>
   43d0a:	83 38 01             	cmpl   $0x1,(%rax)
   43d0d:	74 2a                	je     43d39 <program_image_segment::operator++()+0x81>
        ++ph_;
   43d0f:	48 83 c0 38          	add    $0x38,%rax
   43d13:	48 89 07             	mov    %rax,(%rdi)
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   43d16:	48 39 c2             	cmp    %rax,%rdx
   43d19:	75 ef                	jne    43d0a <program_image_segment::operator++()+0x52>
   43d1b:	c3                   	ret
void program_image_segment::operator++() {
   43d1c:	55                   	push   %rbp
   43d1d:	48 89 e5             	mov    %rsp,%rbp
    assert(ph_ != elf_header_program(elf_, true));
   43d20:	b9 00 00 00 00       	mov    $0x0,%ecx
   43d25:	ba 18 5e 04 00       	mov    $0x45e18,%edx
   43d2a:	be 1c 04 00 00       	mov    $0x41c,%esi
   43d2f:	bf 75 57 04 00       	mov    $0x45775,%edi
   43d34:	e8 eb f0 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
   43d39:	c3                   	ret
   43d3a:	c3                   	ret
   43d3b:	48 85 c0             	test   %rax,%rax
   43d3e:	74 dc                	je     43d1c <program_image_segment::operator++()+0x64>
    ++ph_;
   43d40:	48 83 c0 38          	add    $0x38,%rax
   43d44:	48 89 07             	mov    %rax,(%rdi)
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   43d47:	eb c1                	jmp    43d0a <program_image_segment::operator++()+0x52>
   43d49:	90                   	nop

0000000000043d4a <program_image_segment::operator++(int)>:
void program_image_segment::operator++(int) {
   43d4a:	f3 0f 1e fa          	endbr64
   43d4e:	55                   	push   %rbp
   43d4f:	48 89 e5             	mov    %rsp,%rbp
    ++*this;
   43d52:	e8 61 ff ff ff       	call   43cb8 <program_image_segment::operator++()>
}
   43d57:	5d                   	pop    %rbp
   43d58:	c3                   	ret
   43d59:	90                   	nop

0000000000043d5a <memusage::refresh()>:

// memusage::refresh()
//    Calculate the current physical usage map, using the current process
//    table.

void memusage::refresh() {
   43d5a:	f3 0f 1e fa          	endbr64
   43d5e:	55                   	push   %rbp
   43d5f:	48 89 e5             	mov    %rsp,%rbp
   43d62:	41 57                	push   %r15
   43d64:	41 56                	push   %r14
   43d66:	41 55                	push   %r13
   43d68:	41 54                	push   %r12
   43d6a:	53                   	push   %rbx
   43d6b:	48 83 ec 38          	sub    $0x38,%rsp
   43d6f:	49 89 ff             	mov    %rdi,%r15
    if (!v_) {
   43d72:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   43d76:	74 3f                	je     43db7 <memusage::refresh()+0x5d>
        v_ = reinterpret_cast<unsigned*>(kalloc(PAGESIZE));
        assert(v_ != nullptr);
    }

    memset(v_, 0, (maxpa / PAGESIZE) * sizeof(*v_));
   43d78:	49 8b 3f             	mov    (%r15),%rdi
   43d7b:	ba 00 10 00 00       	mov    $0x1000,%edx
   43d80:	be 00 00 00 00       	mov    $0x0,%esi
   43d85:	e8 b6 0a 00 00       	call   44840 <memset>

    // mark kernel page tables
    for (ptiter it(kernel_pagetable); !it.done(); it.next()) {
   43d8a:	be 00 b0 05 00       	mov    $0x5b000,%esi
   43d8f:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43d93:	e8 8c e7 ff ff       	call   42524 <ptiter::ptiter(x86_64_pagetable*)>
   43d98:	48 b8 ff ff ff ff ff 	movabs $0xffffffffffff,%rax
   43d9f:	ff 00 00 
   43da2:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
   43da6:	72 70                	jb     43e18 <memusage::refresh()+0xbe>
    return *pep_ & PTE_PAMASK;
   43da8:	49 bc 00 f0 ff ff ff 	movabs $0xffffffffff000,%r12
   43daf:	ff 0f 00 
   43db2:	48 89 c3             	mov    %rax,%rbx
   43db5:	eb 3f                	jmp    43df6 <memusage::refresh()+0x9c>
        v_ = reinterpret_cast<unsigned*>(kalloc(PAGESIZE));
   43db7:	bf 00 10 00 00       	mov    $0x1000,%edi
   43dbc:	e8 f8 cd ff ff       	call   40bb9 <kalloc(unsigned long)>
   43dc1:	49 89 07             	mov    %rax,(%r15)
        assert(v_ != nullptr);
   43dc4:	48 85 c0             	test   %rax,%rax
   43dc7:	75 af                	jne    43d78 <memusage::refresh()+0x1e>
   43dc9:	b9 00 00 00 00       	mov    $0x0,%ecx
   43dce:	ba 73 58 04 00       	mov    $0x45873,%edx
   43dd3:	be 49 00 00 00       	mov    $0x49,%esi
   43dd8:	bf 81 58 04 00       	mov    $0x45881,%edi
   43ddd:	e8 42 f0 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
    down(true);
   43de2:	be 01 00 00 00       	mov    $0x1,%esi
   43de7:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43deb:	e8 40 e6 ff ff       	call   42430 <ptiter::down(bool)>
    for (ptiter it(kernel_pagetable); !it.done(); it.next()) {
   43df0:	48 3b 5d c8          	cmp    -0x38(%rbp),%rbx
   43df4:	72 22                	jb     43e18 <memusage::refresh()+0xbe>
    return *pep_ & PTE_PAMASK;
   43df6:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43dfa:	4c 89 e6             	mov    %r12,%rsi
   43dfd:	48 23 30             	and    (%rax),%rsi
   43e00:	48 89 f0             	mov    %rsi,%rax
        if (pa < maxpa) {
   43e03:	48 81 fe ff ff 3f 00 	cmp    $0x3fffff,%rsi
   43e0a:	77 d6                	ja     43de2 <memusage::refresh()+0x88>
            v_[pa / PAGESIZE] |= flags;
   43e0c:	48 c1 e8 0a          	shr    $0xa,%rax
   43e10:	49 03 07             	add    (%r15),%rax
   43e13:	83 08 01             	orl    $0x1,(%rax)
   43e16:	eb ca                	jmp    43de2 <memusage::refresh()+0x88>
// address translation functions for identity-mapped kernels
inline uint64_t kptr2pa(uint64_t kptr) {
    return kptr;
}
template <typename T> inline uint64_t kptr2pa(T* kptr) {
    return reinterpret_cast<uint64_t>(kptr);
   43e18:	b8 00 b0 05 00       	mov    $0x5b000,%eax
        if (pa < maxpa) {
   43e1d:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   43e23:	77 0b                	ja     43e30 <memusage::refresh()+0xd6>
            v_[pa / PAGESIZE] |= flags;
   43e25:	48 c1 e8 0c          	shr    $0xc,%rax
   43e29:	49 8b 17             	mov    (%r15),%rdx
   43e2c:	83 0c 82 01          	orl    $0x1,(%rdx,%rax,4)
        mark(it.pa(), f_kernel);
    }
    mark(kptr2pa(kernel_pagetable), f_kernel);
    mark(kptr2pa(v_), f_kernel);
   43e30:	49 8b 07             	mov    (%r15),%rax
        if (pa < maxpa) {
   43e33:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   43e39:	77 0b                	ja     43e46 <memusage::refresh()+0xec>
            v_[pa / PAGESIZE] |= flags;
   43e3b:	48 89 c2             	mov    %rax,%rdx
   43e3e:	48 c1 ea 0c          	shr    $0xc,%rdx
   43e42:	83 0c 90 01          	orl    $0x1,(%rax,%rdx,4)

    // mark pages accessible from each process's page table
    separate_tables_ = false;
   43e46:	41 c6 47 0c 00       	movb   $0x0,0xc(%r15)
    for (int pid = 1; pid < NPROC; ++pid) {
   43e4b:	41 bc f0 92 05 00    	mov    $0x592f0,%r12d
   43e51:	bb 01 00 00 00       	mov    $0x1,%ebx
        if (p->state != P_FREE
            && p->pagetable
            && p->pagetable != kernel_pagetable) {
            separate_tables_ = true;

            for (ptiter it(p); it.va() < VA_LOWEND; it.next()) {
   43e56:	49 bd ff ff ff ff ff 	movabs $0x7fffffffffff,%r13
   43e5d:	7f 00 00 
   43e60:	e9 65 01 00 00       	jmp    43fca <memusage::refresh()+0x270>
            return 0;
   43e65:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%rbp)
   43e6c:	e9 78 01 00 00       	jmp    43fe9 <memusage::refresh()+0x28f>
    down(true);
   43e71:	be 01 00 00 00       	mov    $0x1,%esi
   43e76:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43e7a:	e8 b1 e5 ff ff       	call   42430 <ptiter::down(bool)>
    return (1UL << (PAGEOFFBITS + level * PAGEINDEXBITS)) - 1;
   43e7f:	8b 45 c0             	mov    -0x40(%rbp),%eax
   43e82:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   43e86:	b8 01 00 00 00       	mov    $0x1,%eax
   43e8b:	48 d3 e0             	shl    %cl,%rax
    return va_ & ~pageoffmask(level_);
   43e8e:	48 f7 d8             	neg    %rax
   43e91:	48 23 45 c8          	and    -0x38(%rbp),%rax
            for (ptiter it(p); it.va() < VA_LOWEND; it.next()) {
   43e95:	49 39 c5             	cmp    %rax,%r13
   43e98:	0f 82 8a 01 00 00    	jb     44028 <memusage::refresh()+0x2ce>
    return *pep_ & PTE_PAMASK;
   43e9e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43ea2:	48 bf 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdi
   43ea9:	ff 0f 00 
   43eac:	48 23 38             	and    (%rax),%rdi
   43eaf:	48 89 f8             	mov    %rdi,%rax
        if (pa < maxpa) {
   43eb2:	48 81 ff ff ff 3f 00 	cmp    $0x3fffff,%rdi
   43eb9:	77 b6                	ja     43e71 <memusage::refresh()+0x117>
            v_[pa / PAGESIZE] |= flags;
   43ebb:	48 c1 e8 0a          	shr    $0xa,%rax
   43ebf:	49 03 07             	add    (%r15),%rax
   43ec2:	8b 55 ac             	mov    -0x54(%rbp),%edx
   43ec5:	0b 10                	or     (%rax),%edx
   43ec7:	83 ca 01             	or     $0x1,%edx
   43eca:	89 10                	mov    %edx,(%rax)
   43ecc:	eb a3                	jmp    43e71 <memusage::refresh()+0x117>
        if (pa < maxpa) {
   43ece:	48 81 ff ff ff 3f 00 	cmp    $0x3fffff,%rdi
   43ed5:	77 15                	ja     43eec <memusage::refresh()+0x192>
            v_[pa / PAGESIZE] |= flags;
   43ed7:	48 c1 ef 0c          	shr    $0xc,%rdi
   43edb:	49 8b 07             	mov    (%r15),%rax
   43ede:	48 8d 14 b8          	lea    (%rax,%rdi,4),%rdx
   43ee2:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43ee5:	0b 02                	or     (%rdx),%eax
   43ee7:	83 c8 02             	or     $0x2,%eax
   43eea:	89 02                	mov    %eax,(%rdx)
                    if (it.va() == it.pa()) {
                        mark(it.pa(), f_user | pidflag);
                    } else {
                        mark(it.pa(), f_user | f_nonidentity | pidflag);
                    }
                    it.next();
   43eec:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43ef0:	e8 39 e3 ff ff       	call   4222e <vmiter::next()>
    return va_;
   43ef5:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
            for (vmiter it(p, 0); it.va() < VA_LOWEND; ) {
   43ef9:	49 39 fd             	cmp    %rdi,%r13
   43efc:	0f 82 b5 00 00 00    	jb     43fb7 <memusage::refresh()+0x25d>
    uint64_t ph = *pep_ & perm_;
   43f02:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   43f06:	48 8b 08             	mov    (%rax),%rcx
   43f09:	48 63 55 c4          	movslq -0x3c(%rbp),%rdx
   43f0d:	48 21 ca             	and    %rcx,%rdx
    return ph & -(ph & PTE_P);
   43f10:	48 89 d0             	mov    %rdx,%rax
   43f13:	83 e0 01             	and    $0x1,%eax
   43f16:	48 f7 d8             	neg    %rax
   43f19:	48 21 d0             	and    %rdx,%rax
                if (it.user()) {
   43f1c:	48 f7 d0             	not    %rax
   43f1f:	a8 05                	test   $0x5,%al
   43f21:	75 6e                	jne    43f91 <memusage::refresh()+0x237>
    if (*pep_ & PTE_P) {
   43f23:	f6 c1 01             	test   $0x1,%cl
   43f26:	74 c4                	je     43eec <memusage::refresh()+0x192>
        if (level_ > 0) {
   43f28:	8b 45 c0             	mov    -0x40(%rbp),%eax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43f2b:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   43f32:	ff 0f 00 
   43f35:	48 21 ca             	and    %rcx,%rdx
   43f38:	48 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rsi
   43f3f:	ff 0f 00 
   43f42:	48 21 f1             	and    %rsi,%rcx
   43f45:	85 c0                	test   %eax,%eax
   43f47:	48 0f 4f d1          	cmovg  %rcx,%rdx
   43f4b:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   43f4f:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   43f56:	48 d3 e0             	shl    %cl,%rax
   43f59:	48 f7 d0             	not    %rax
   43f5c:	48 21 f8             	and    %rdi,%rax
   43f5f:	48 01 d0             	add    %rdx,%rax
                    if (it.va() == it.pa()) {
   43f62:	48 39 f8             	cmp    %rdi,%rax
   43f65:	0f 84 63 ff ff ff    	je     43ece <memusage::refresh()+0x174>
        if (pa < maxpa) {
   43f6b:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   43f71:	0f 87 75 ff ff ff    	ja     43eec <memusage::refresh()+0x192>
            v_[pa / PAGESIZE] |= flags;
   43f77:	48 c1 e8 0c          	shr    $0xc,%rax
   43f7b:	49 8b 17             	mov    (%r15),%rdx
   43f7e:	48 8d 14 82          	lea    (%rdx,%rax,4),%rdx
   43f82:	8b 45 ac             	mov    -0x54(%rbp),%eax
   43f85:	0b 02                	or     (%rdx),%eax
   43f87:	83 c8 06             	or     $0x6,%eax
   43f8a:	89 02                	mov    %eax,(%rdx)
   43f8c:	e9 5b ff ff ff       	jmp    43eec <memusage::refresh()+0x192>
   43f91:	8b 45 c0             	mov    -0x40(%rbp),%eax
   43f94:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   43f98:	4c 89 f6             	mov    %r14,%rsi
   43f9b:	48 d3 e6             	shl    %cl,%rsi
   43f9e:	48 83 ee 01          	sub    $0x1,%rsi
    return (va_ | pageoffmask(level_)) + 1;
   43fa2:	48 09 fe             	or     %rdi,%rsi
   43fa5:	48 83 c6 01          	add    $0x1,%rsi
    real_find(last_va());
   43fa9:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   43fad:	e8 ba e0 ff ff       	call   4206c <vmiter::real_find(unsigned long)>
}
   43fb2:	e9 3e ff ff ff       	jmp    43ef5 <memusage::refresh()+0x19b>
    for (int pid = 1; pid < NPROC; ++pid) {
   43fb7:	83 c3 01             	add    $0x1,%ebx
   43fba:	49 81 c4 d0 00 00 00 	add    $0xd0,%r12
   43fc1:	83 fb 10             	cmp    $0x10,%ebx
   43fc4:	0f 84 c5 00 00 00    	je     4408f <memusage::refresh()+0x335>
        } else if (pid >= 1) {
   43fca:	85 db                	test   %ebx,%ebx
   43fcc:	0f 8e 17 02 00 00    	jle    441e9 <memusage::refresh()+0x48f>
        if (p->state != P_FREE
   43fd2:	4d 89 e6             	mov    %r12,%r14
   43fd5:	41 83 7c 24 0c 00    	cmpl   $0x0,0xc(%r12)
   43fdb:	74 da                	je     43fb7 <memusage::refresh()+0x25d>
            return 4U << pid;
   43fdd:	b8 04 00 00 00       	mov    $0x4,%eax
   43fe2:	89 d9                	mov    %ebx,%ecx
   43fe4:	d3 e0                	shl    %cl,%eax
   43fe6:	89 45 ac             	mov    %eax,-0x54(%rbp)
            && p->pagetable
   43fe9:	49 8b 06             	mov    (%r14),%rax
            && p->pagetable != kernel_pagetable) {
   43fec:	48 85 c0             	test   %rax,%rax
   43fef:	74 c6                	je     43fb7 <memusage::refresh()+0x25d>
   43ff1:	48 3d 00 b0 05 00    	cmp    $0x5b000,%rax
   43ff7:	74 be                	je     43fb7 <memusage::refresh()+0x25d>
            separate_tables_ = true;
   43ff9:	41 c6 47 0c 01       	movb   $0x1,0xc(%r15)
    : ptiter(p->pagetable) {
   43ffe:	49 8b 36             	mov    (%r14),%rsi
   44001:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   44005:	e8 1a e5 ff ff       	call   42524 <ptiter::ptiter(x86_64_pagetable*)>
   4400a:	8b 45 c0             	mov    -0x40(%rbp),%eax
   4400d:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   44011:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    return va_ & ~pageoffmask(level_);
   44018:	48 d3 e0             	shl    %cl,%rax
   4401b:	48 23 45 c8          	and    -0x38(%rbp),%rax
            for (ptiter it(p); it.va() < VA_LOWEND; it.next()) {
   4401f:	49 39 c5             	cmp    %rax,%r13
   44022:	0f 83 76 fe ff ff    	jae    43e9e <memusage::refresh()+0x144>
   44028:	49 8b 06             	mov    (%r14),%rax
        if (pa < maxpa) {
   4402b:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   44031:	77 15                	ja     44048 <memusage::refresh()+0x2ee>
            v_[pa / PAGESIZE] |= flags;
   44033:	48 c1 e8 0c          	shr    $0xc,%rax
   44037:	49 8b 17             	mov    (%r15),%rdx
   4403a:	48 8d 14 82          	lea    (%rdx,%rax,4),%rdx
   4403e:	8b 45 ac             	mov    -0x54(%rbp),%eax
   44041:	0b 02                	or     (%rdx),%eax
   44043:	83 c8 01             	or     $0x1,%eax
   44046:	89 02                	mov    %eax,(%rdx)
    : vmiter(p->pagetable, va) {
   44048:	49 8b 06             	mov    (%r14),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4404b:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   4404f:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   44053:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   4405a:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   44061:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   44068:	00 
    real_find(va);
   44069:	be 00 00 00 00       	mov    $0x0,%esi
   4406e:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   44072:	e8 f5 df ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   44077:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
            for (vmiter it(p, 0); it.va() < VA_LOWEND; ) {
   4407b:	49 39 fd             	cmp    %rdi,%r13
   4407e:	0f 82 33 ff ff ff    	jb     43fb7 <memusage::refresh()+0x25d>
   44084:	41 be 01 00 00 00    	mov    $0x1,%r14d
   4408a:	e9 73 fe ff ff       	jmp    43f02 <memusage::refresh()+0x1a8>
            }
        }
    }

    // if no different process page tables, use physical address instead
    if (!separate_tables_) {
   4408f:	41 80 7f 0c 00       	cmpb   $0x0,0xc(%r15)
   44094:	74 0f                	je     440a5 <memusage::refresh()+0x34b>
            } else {
                it.next_range();
            }
        }
    }
}
   44096:	48 83 c4 38          	add    $0x38,%rsp
   4409a:	5b                   	pop    %rbx
   4409b:	41 5c                	pop    %r12
   4409d:	41 5d                	pop    %r13
   4409f:	41 5e                	pop    %r14
   440a1:	41 5f                	pop    %r15
   440a3:	5d                   	pop    %rbp
   440a4:	c3                   	ret
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   440a5:	48 c7 45 b0 00 b0 05 	movq   $0x5b000,-0x50(%rbp)
   440ac:	00 
   440ad:	48 c7 45 b8 00 b0 05 	movq   $0x5b000,-0x48(%rbp)
   440b4:	00 
   440b5:	c7 45 c0 03 00 00 00 	movl   $0x3,-0x40(%rbp)
   440bc:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   440c3:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   440ca:	00 
    real_find(va);
   440cb:	be 00 00 00 00       	mov    $0x0,%esi
   440d0:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   440d4:	e8 93 df ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   440d9:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
        for (vmiter it(kernel_pagetable, 0); it.va() < VA_LOWEND; ) {
   440dd:	48 89 d0             	mov    %rdx,%rax
   440e0:	48 c1 e8 2f          	shr    $0x2f,%rax
   440e4:	75 b0                	jne    44096 <memusage::refresh()+0x33c>
   440e6:	41 bc 01 00 00 00    	mov    $0x1,%r12d
            pa &= ~0x1000UL;
   440ec:	49 bd 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r13
   440f3:	ff 0f 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   440f6:	49 be 00 f0 ff ff ff 	movabs $0xffffffffff000,%r14
   440fd:	ff 0f 00 
   44100:	48 bb ff ff ff ff ff 	movabs $0x7fffffffffff,%rbx
   44107:	7f 00 00 
   4410a:	eb 2e                	jmp    4413a <memusage::refresh()+0x3e0>
   4410c:	8b 45 c0             	mov    -0x40(%rbp),%eax
   4410f:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
   44113:	4c 89 e6             	mov    %r12,%rsi
   44116:	48 d3 e6             	shl    %cl,%rsi
   44119:	48 83 ee 01          	sub    $0x1,%rsi
    return (va_ | pageoffmask(level_)) + 1;
   4411d:	48 09 d6             	or     %rdx,%rsi
   44120:	48 83 c6 01          	add    $0x1,%rsi
    real_find(last_va());
   44124:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   44128:	e8 3f df ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   4412d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
   44131:	48 39 d3             	cmp    %rdx,%rbx
   44134:	0f 82 5c ff ff ff    	jb     44096 <memusage::refresh()+0x33c>
    uint64_t ph = *pep_ & perm_;
   4413a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4413e:	48 8b 30             	mov    (%rax),%rsi
   44141:	48 63 4d c4          	movslq -0x3c(%rbp),%rcx
   44145:	48 21 f1             	and    %rsi,%rcx
    return ph & -(ph & PTE_P);
   44148:	48 89 c8             	mov    %rcx,%rax
   4414b:	83 e0 01             	and    $0x1,%eax
   4414e:	48 f7 d8             	neg    %rax
   44151:	48 21 c8             	and    %rcx,%rax
                && physpages[it.pa() / PAGESIZE].used()) {
   44154:	48 f7 d0             	not    %rax
   44157:	a8 05                	test   $0x5,%al
   44159:	75 b1                	jne    4410c <memusage::refresh()+0x3b2>
    if (*pep_ & PTE_P) {
   4415b:	40 f6 c6 01          	test   $0x1,%sil
   4415f:	74 ab                	je     4410c <memusage::refresh()+0x3b2>
        if (level_ > 0) {
   44161:	8b 45 c0             	mov    -0x40(%rbp),%eax
            pa &= ~0x1000UL;
   44164:	48 89 f1             	mov    %rsi,%rcx
   44167:	4c 21 e9             	and    %r13,%rcx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   4416a:	48 89 f7             	mov    %rsi,%rdi
   4416d:	4c 21 f7             	and    %r14,%rdi
   44170:	85 c0                	test   %eax,%eax
   44172:	48 0f 4f f9          	cmovg  %rcx,%rdi
   44176:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   4417a:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   44181:	48 d3 e0             	shl    %cl,%rax
   44184:	48 f7 d0             	not    %rax
   44187:	48 21 d0             	and    %rdx,%rax
   4418a:	48 01 f8             	add    %rdi,%rax
                && it.pa() < MEMSIZE_PHYSICAL
   4418d:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   44193:	0f 87 73 ff ff ff    	ja     4410c <memusage::refresh()+0x3b2>
                && physpages[it.pa() / PAGESIZE].used()) {
   44199:	48 89 c6             	mov    %rax,%rsi
   4419c:	48 c1 ee 0c          	shr    $0xc,%rsi
   441a0:	80 be 00 90 05 00 00 	cmpb   $0x0,0x59000(%rsi)
   441a7:	0f 84 5f ff ff ff    	je     4410c <memusage::refresh()+0x3b2>
                unsigned owner = (it.pa() - PROC_START_ADDR) / 0x40000;
   441ad:	48 2d 00 00 10 00    	sub    $0x100000,%rax
   441b3:	48 c1 e8 12          	shr    $0x12,%rax
            return 0;
   441b7:	ba 00 00 00 00       	mov    $0x0,%edx
        } else if (pid >= 1) {
   441bc:	83 f8 1b             	cmp    $0x1b,%eax
   441bf:	76 1c                	jbe    441dd <memusage::refresh()+0x483>
            v_[pa / PAGESIZE] |= flags;
   441c1:	49 8b 07             	mov    (%r15),%rax
   441c4:	48 8d 04 b0          	lea    (%rax,%rsi,4),%rax
   441c8:	0b 10                	or     (%rax),%edx
   441ca:	83 ca 02             	or     $0x2,%edx
   441cd:	89 10                	mov    %edx,(%rax)
                it.next();
   441cf:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   441d3:	e8 56 e0 ff ff       	call   4222e <vmiter::next()>
   441d8:	e9 50 ff ff ff       	jmp    4412d <memusage::refresh()+0x3d3>
                mark(it.pa(), f_user | f_process(owner + 1));
   441dd:	8d 48 01             	lea    0x1(%rax),%ecx
            return 4U << pid;
   441e0:	ba 04 00 00 00       	mov    $0x4,%edx
   441e5:	d3 e2                	shl    %cl,%edx
   441e7:	eb d8                	jmp    441c1 <memusage::refresh()+0x467>
        if (p->state != P_FREE
   441e9:	4d 89 e6             	mov    %r12,%r14
   441ec:	41 83 7c 24 0c 00    	cmpl   $0x0,0xc(%r12)
   441f2:	0f 85 6d fc ff ff    	jne    43e65 <memusage::refresh()+0x10b>
    for (int pid = 1; pid < NPROC; ++pid) {
   441f8:	83 c3 01             	add    $0x1,%ebx
   441fb:	49 81 c4 d0 00 00 00 	add    $0xd0,%r12
   44202:	e9 c3 fd ff ff       	jmp    43fca <memusage::refresh()+0x270>
   44207:	90                   	nop

0000000000044208 <memusage::page_error(unsigned long, char const*, int) const>:

void memusage::page_error(uintptr_t pa, const char* desc, int pid) const {
   44208:	f3 0f 1e fa          	endbr64
   4420c:	55                   	push   %rbp
   4420d:	48 89 e5             	mov    %rsp,%rbp
   44210:	41 57                	push   %r15
   44212:	41 56                	push   %r14
   44214:	41 55                	push   %r13
   44216:	41 54                	push   %r12
   44218:	53                   	push   %rbx
   44219:	48 83 ec 08          	sub    $0x8,%rsp
   4421d:	49 89 ff             	mov    %rdi,%r15
   44220:	49 89 f5             	mov    %rsi,%r13
   44223:	49 89 d6             	mov    %rdx,%r14
   44226:	89 cb                	mov    %ecx,%ebx
    const char* fmt = pid >= 0
        ? "PAGE TABLE ERROR: %lx: %s (pid %d)\n"
   44228:	85 c9                	test   %ecx,%ecx
   4422a:	41 bc 90 58 04 00    	mov    $0x45890,%r12d
   44230:	b8 70 5e 04 00       	mov    $0x45e70,%eax
   44235:	4c 0f 49 e0          	cmovns %rax,%r12
        : "PAGE TABLE ERROR: %lx: %s\n";
    error_printf(CPOS(22, 0), COLOR_ERROR, fmt, pa, desc, pid);
   44239:	41 89 c9             	mov    %ecx,%r9d
   4423c:	49 89 d0             	mov    %rdx,%r8
   4423f:	48 89 f1             	mov    %rsi,%rcx
   44242:	4c 89 e2             	mov    %r12,%rdx
   44245:	be 00 c0 00 00       	mov    $0xc000,%esi
   4424a:	bf e0 06 00 00       	mov    $0x6e0,%edi
   4424f:	b0 00                	mov    $0x0,%al
   44251:	e8 63 12 00 00       	call   454b9 <error_printf(int, int, char const*, ...)>
    if (nerrors_ < UINT_MAX) {
   44256:	41 8b 47 08          	mov    0x8(%r15),%eax
   4425a:	83 f8 ff             	cmp    $0xffffffff,%eax
   4425d:	74 1d                	je     4427c <memusage::page_error(unsigned long, char const*, int) const+0x74>
        ++nerrors_;
   4425f:	ff c0                	inc    %eax
   44261:	41 89 47 08          	mov    %eax,0x8(%r15)
    }
    if (nerrors_ < 10) {
   44265:	83 f8 09             	cmp    $0x9,%eax
   44268:	77 12                	ja     4427c <memusage::page_error(unsigned long, char const*, int) const+0x74>
        log_printf(fmt, pa, desc, pid);
   4426a:	89 d9                	mov    %ebx,%ecx
   4426c:	4c 89 f2             	mov    %r14,%rdx
   4426f:	4c 89 ee             	mov    %r13,%rsi
   44272:	4c 89 e7             	mov    %r12,%rdi
   44275:	b0 00                	mov    $0x0,%al
   44277:	e8 70 e6 ff ff       	call   428ec <log_printf(char const*, ...)>
    }
}
   4427c:	48 83 c4 08          	add    $0x8,%rsp
   44280:	5b                   	pop    %rbx
   44281:	41 5c                	pop    %r12
   44283:	41 5d                	pop    %r13
   44285:	41 5e                	pop    %r14
   44287:	41 5f                	pop    %r15
   44289:	5d                   	pop    %rbp
   4428a:	c3                   	ret
   4428b:	90                   	nop

000000000004428c <memusage::symbol_at(unsigned long) const>:

uint16_t memusage::symbol_at(uintptr_t pa) const {
   4428c:	f3 0f 1e fa          	endbr64
   44290:	55                   	push   %rbp
   44291:	48 89 e5             	mov    %rsp,%rbp
   44294:	41 57                	push   %r15
   44296:	41 56                	push   %r14
   44298:	41 55                	push   %r13
   4429a:	41 54                	push   %r12
   4429c:	53                   	push   %rbx
   4429d:	48 83 ec 18          	sub    $0x18,%rsp
   442a1:	49 89 fd             	mov    %rdi,%r13
   442a4:	48 89 f3             	mov    %rsi,%rbx
    bool is_reserved = reserved_physical_address(pa);
   442a7:	48 89 f7             	mov    %rsi,%rdi
   442aa:	e8 8c e3 ff ff       	call   4263b <reserved_physical_address(unsigned long)>
   442af:	41 89 c4             	mov    %eax,%r12d
    bool is_kernel = !is_reserved && !allocatable_physical_address(pa);
   442b2:	84 c0                	test   %al,%al
   442b4:	74 56                	je     4430c <memusage::symbol_at(unsigned long) const+0x80>

    if (pa >= maxpa) {
        if (is_kernel) {
            return 'K' | 0x4000;
        } else if (is_reserved) {
            return '?' | 0x4000;
   442b6:	b8 3f 40 00 00       	mov    $0x403f,%eax
    if (pa >= maxpa) {
   442bb:	48 81 fb ff ff 3f 00 	cmp    $0x3fffff,%rbx
   442c2:	77 6e                	ja     44332 <memusage::symbol_at(unsigned long) const+0xa6>
            return '?' | 0xF000;
        }
    }

    // flags for this physical page
    auto v = v_[pa / PAGESIZE];
   442c4:	48 89 df             	mov    %rbx,%rdi
   442c7:	48 c1 ef 0c          	shr    $0xc,%rdi
   442cb:	49 8b 45 00          	mov    0x0(%r13),%rax
   442cf:	44 8b 3c b8          	mov    (%rax,%rdi,4),%r15d
        return lsb(v >> 3);
   442d3:	44 89 f9             	mov    %r15d,%ecx
   442d6:	c1 e9 03             	shr    $0x3,%ecx
    return __builtin_ffs(x);
   442d9:	44 0f bc f1          	bsf    %ecx,%r14d
   442dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   442e2:	44 0f 44 f0          	cmove  %eax,%r14d
   442e6:	41 83 c6 01          	add    $0x1,%r14d
    // lowest process involved with this page; 0 if no process
    pid_t pid = marked_pid(v);
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   442ea:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   442ef:	48 39 c3             	cmp    %rax,%rbx
   442f2:	72 4d                	jb     44341 <memusage::symbol_at(unsigned long) const+0xb5>
   442f4:	ba 00 00 00 00       	mov    $0x0,%edx
   442f9:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        return 'C' | 0x0700;
   44300:	b8 43 07 00 00       	mov    $0x743,%eax
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   44305:	48 39 f3             	cmp    %rsi,%rbx
   44308:	73 3c                	jae    44346 <memusage::symbol_at(unsigned long) const+0xba>
   4430a:	eb 26                	jmp    44332 <memusage::symbol_at(unsigned long) const+0xa6>
    bool is_kernel = !is_reserved && !allocatable_physical_address(pa);
   4430c:	48 89 df             	mov    %rbx,%rdi
   4430f:	e8 48 e3 ff ff       	call   4265c <allocatable_physical_address(unsigned long)>
   44314:	83 f0 01             	xor    $0x1,%eax
   44317:	89 c2                	mov    %eax,%edx
    if (pa >= maxpa) {
   44319:	48 81 fb ff ff 3f 00 	cmp    $0x3fffff,%rbx
   44320:	0f 86 cb 01 00 00    	jbe    444f1 <memusage::symbol_at(unsigned long) const+0x265>
            return '?' | 0xF000;
   44326:	3c 01                	cmp    $0x1,%al
   44328:	19 c0                	sbb    %eax,%eax
   4432a:	66 25 f4 af          	and    $0xaff4,%ax
   4432e:	66 05 4b 40          	add    $0x404b,%ax
                ch |= names[pid];
            }
            return ch;
        }
    }
}
   44332:	48 83 c4 18          	add    $0x18,%rsp
   44336:	5b                   	pop    %rbx
   44337:	41 5c                	pop    %r12
   44339:	41 5d                	pop    %r13
   4433b:	41 5e                	pop    %r14
   4433d:	41 5f                	pop    %r15
   4433f:	5d                   	pop    %rbp
   44340:	c3                   	ret
   44341:	ba 00 00 00 00       	mov    $0x0,%edx
    } else if (is_reserved && pid != 0) {
   44346:	85 c9                	test   %ecx,%ecx
   44348:	0f 95 45 cf          	setne  -0x31(%rbp)
   4434c:	74 05                	je     44353 <memusage::symbol_at(unsigned long) const+0xc7>
   4434e:	45 84 e4             	test   %r12b,%r12b
   44351:	75 22                	jne    44375 <memusage::symbol_at(unsigned long) const+0xe9>
        return 'R' | 0x0700;
   44353:	b8 52 07 00 00       	mov    $0x752,%eax
    } else if (is_reserved) {
   44358:	45 84 e4             	test   %r12b,%r12b
   4435b:	75 d5                	jne    44332 <memusage::symbol_at(unsigned long) const+0xa6>
    } else if (is_kernel && pid != 0 && separate_tables_) {
   4435d:	80 7d cf 00          	cmpb   $0x0,-0x31(%rbp)
   44361:	74 46                	je     443a9 <memusage::symbol_at(unsigned long) const+0x11d>
   44363:	84 d2                	test   %dl,%dl
   44365:	74 42                	je     443a9 <memusage::symbol_at(unsigned long) const+0x11d>
   44367:	41 80 7d 0c 00       	cmpb   $0x0,0xc(%r13)
   4436c:	75 21                	jne    4438f <memusage::symbol_at(unsigned long) const+0x103>
        return 'K' | 0x0D00;
   4436e:	b8 4b 0d 00 00       	mov    $0xd4b,%eax
   44373:	eb bd                	jmp    44332 <memusage::symbol_at(unsigned long) const+0xa6>
        page_error(pa, "reserved page mapped for user", marked_pid(v));
   44375:	44 89 f1             	mov    %r14d,%ecx
   44378:	ba ab 58 04 00       	mov    $0x458ab,%edx
   4437d:	48 89 de             	mov    %rbx,%rsi
   44380:	4c 89 ef             	mov    %r13,%rdi
   44383:	e8 80 fe ff ff       	call   44208 <memusage::page_error(unsigned long, char const*, int) const>
        return 'R' | 0x0C00;
   44388:	b8 52 0c 00 00       	mov    $0xc52,%eax
   4438d:	eb a3                	jmp    44332 <memusage::symbol_at(unsigned long) const+0xa6>
        page_error(pa, "kernel data page mapped for user", marked_pid(v));
   4438f:	44 89 f1             	mov    %r14d,%ecx
   44392:	ba 98 5e 04 00       	mov    $0x45e98,%edx
   44397:	48 89 de             	mov    %rbx,%rsi
   4439a:	4c 89 ef             	mov    %r13,%rdi
   4439d:	e8 66 fe ff ff       	call   44208 <memusage::page_error(unsigned long, char const*, int) const>
        return 'K' | 0xCD00;
   443a2:	b8 4b cd ff ff       	mov    $0xffffcd4b,%eax
   443a7:	eb 89                	jmp    44332 <memusage::symbol_at(unsigned long) const+0xa6>
    } else if (is_kernel) {
   443a9:	84 d2                	test   %dl,%dl
   443ab:	0f 85 22 01 00 00    	jne    444d3 <memusage::symbol_at(unsigned long) const+0x247>
        return ' ' | 0x0700;
   443b1:	b8 20 07 00 00       	mov    $0x720,%eax
    } else if (pa >= MEMSIZE_PHYSICAL) {
   443b6:	48 81 fb ff ff 1f 00 	cmp    $0x1fffff,%rbx
   443bd:	0f 87 6f ff ff ff    	ja     44332 <memusage::symbol_at(unsigned long) const+0xa6>
        if (vx == 0) {
   443c3:	44 89 f8             	mov    %r15d,%eax
   443c6:	83 e0 fb             	and    $0xfffffffb,%eax
   443c9:	75 16                	jne    443e1 <memusage::symbol_at(unsigned long) const+0x155>
                return 'L' | 0x0300;
   443cb:	80 bf 00 90 05 00 01 	cmpb   $0x1,0x59000(%rdi)
   443d2:	19 c0                	sbb    %eax,%eax
   443d4:	66 25 e2 03          	and    $0x3e2,%ax
   443d8:	66 05 4c 03          	add    $0x34c,%ax
   443dc:	e9 51 ff ff ff       	jmp    44332 <memusage::symbol_at(unsigned long) const+0xa6>
        } else if (vx == f_kernel) {
   443e1:	83 f8 01             	cmp    $0x1,%eax
   443e4:	0f 84 f3 00 00 00    	je     444dd <memusage::symbol_at(unsigned long) const+0x251>
        } else if (vx == f_user) {
   443ea:	83 f8 02             	cmp    $0x2,%eax
   443ed:	0f 84 f4 00 00 00    	je     444e7 <memusage::symbol_at(unsigned long) const+0x25b>
        } else if ((v & f_kernel) && (v & f_user) && separate_tables_) {
   443f3:	44 89 f8             	mov    %r15d,%eax
   443f6:	f7 d0                	not    %eax
   443f8:	a8 03                	test   $0x3,%al
   443fa:	74 6e                	je     4446a <memusage::symbol_at(unsigned long) const+0x1de>
            uint16_t ch = colors[pid % 5] << 8;
   443fc:	49 63 c6             	movslq %r14d,%rax
   443ff:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   44406:	48 c1 f8 21          	sar    $0x21,%rax
   4440a:	44 89 f2             	mov    %r14d,%edx
   4440d:	c1 fa 1f             	sar    $0x1f,%edx
   44410:	29 d0                	sub    %edx,%eax
   44412:	8d 14 80             	lea    (%rax,%rax,4),%edx
   44415:	44 89 f0             	mov    %r14d,%eax
   44418:	29 d0                	sub    %edx,%eax
   4441a:	48 98                	cltq
   4441c:	0f b6 80 61 61 04 00 	movzbl 0x46161(%rax),%eax
   44423:	c1 e0 08             	shl    $0x8,%eax
   44426:	41 89 c4             	mov    %eax,%r12d
            if (v & f_kernel) {
   44429:	41 f6 c7 01          	test   $0x1,%r15b
   4442d:	74 14                	je     44443 <memusage::symbol_at(unsigned long) const+0x1b7>
                ch = 0x4000 | (ch == 0x0C00 ? 0x0F00 : ch);
   4442f:	89 c2                	mov    %eax,%edx
   44431:	80 ce 40             	or     $0x40,%dh
   44434:	66 3d 00 0c          	cmp    $0xc00,%ax
   44438:	b8 00 4f 00 00       	mov    $0x4f00,%eax
   4443d:	0f 45 c2             	cmovne %edx,%eax
   44440:	41 89 c4             	mov    %eax,%r12d
            if (!physpages[pa / PAGESIZE].used() && (v & f_nonidentity)) {
   44443:	80 bf 00 90 05 00 00 	cmpb   $0x0,0x59000(%rdi)
   4444a:	75 06                	jne    44452 <memusage::symbol_at(unsigned long) const+0x1c6>
   4444c:	41 f6 c7 04          	test   $0x4,%r15b
   44450:	75 3c                	jne    4448e <memusage::symbol_at(unsigned long) const+0x202>
        } else if (pid >= 1) {
   44452:	41 83 fe 1c          	cmp    $0x1c,%r14d
   44456:	7f 51                	jg     444a9 <memusage::symbol_at(unsigned long) const+0x21d>
   44458:	80 7d cf 00          	cmpb   $0x0,-0x31(%rbp)
   4445c:	74 4b                	je     444a9 <memusage::symbol_at(unsigned long) const+0x21d>
            return 4U << pid;
   4445e:	ba 04 00 00 00       	mov    $0x4,%edx
   44463:	44 89 f1             	mov    %r14d,%ecx
   44466:	d3 e2                	shl    %cl,%edx
   44468:	eb 44                	jmp    444ae <memusage::symbol_at(unsigned long) const+0x222>
        } else if ((v & f_kernel) && (v & f_user) && separate_tables_) {
   4446a:	41 80 7d 0c 00       	cmpb   $0x0,0xc(%r13)
   4446f:	74 8b                	je     443fc <memusage::symbol_at(unsigned long) const+0x170>
            page_error(pa, "kernel allocated page mapped for user",
   44471:	44 89 f1             	mov    %r14d,%ecx
   44474:	ba c0 5e 04 00       	mov    $0x45ec0,%edx
   44479:	48 89 de             	mov    %rbx,%rsi
   4447c:	4c 89 ef             	mov    %r13,%rdi
   4447f:	e8 84 fd ff ff       	call   44208 <memusage::page_error(unsigned long, char const*, int) const>
            return '*' | 0xF400;
   44484:	b8 2a f4 ff ff       	mov    $0xfffff42a,%eax
   44489:	e9 a4 fe ff ff       	jmp    44332 <memusage::symbol_at(unsigned long) const+0xa6>
                page_error(pa, "freed page mapped for user", pid);
   4448e:	44 89 f1             	mov    %r14d,%ecx
   44491:	ba c9 58 04 00       	mov    $0x458c9,%edx
   44496:	48 89 de             	mov    %rbx,%rsi
   44499:	4c 89 ef             	mov    %r13,%rdi
   4449c:	e8 67 fd ff ff       	call   44208 <memusage::page_error(unsigned long, char const*, int) const>
                ch |= 0xF000;
   444a1:	66 41 81 cc 00 f0    	or     $0xf000,%r12w
   444a7:	eb a9                	jmp    44452 <memusage::symbol_at(unsigned long) const+0x1c6>
            return 0;
   444a9:	ba 00 00 00 00       	mov    $0x0,%edx
            if (v > (f_process(pid) | f_kernel | f_user | f_nonidentity)) {
   444ae:	83 ca 07             	or     $0x7,%edx
                ch = 0x0F00 | 'S';
   444b1:	b8 53 0f 00 00       	mov    $0xf53,%eax
            if (v > (f_process(pid) | f_kernel | f_user | f_nonidentity)) {
   444b6:	44 39 fa             	cmp    %r15d,%edx
   444b9:	0f 82 73 fe ff ff    	jb     44332 <memusage::symbol_at(unsigned long) const+0xa6>
                ch |= names[pid];
   444bf:	4d 63 f6             	movslq %r14d,%r14
   444c2:	66 41 0f be 86 40 61 	movsbw 0x46140(%r14),%ax
   444c9:	04 00 
   444cb:	44 09 e0             	or     %r12d,%eax
   444ce:	e9 5f fe ff ff       	jmp    44332 <memusage::symbol_at(unsigned long) const+0xa6>
        return 'K' | 0x0D00;
   444d3:	b8 4b 0d 00 00       	mov    $0xd4b,%eax
   444d8:	e9 55 fe ff ff       	jmp    44332 <memusage::symbol_at(unsigned long) const+0xa6>
            return 'K' | 0x0D00;
   444dd:	b8 4b 0d 00 00       	mov    $0xd4b,%eax
   444e2:	e9 4b fe ff ff       	jmp    44332 <memusage::symbol_at(unsigned long) const+0xa6>
            return '.' | 0x0700;
   444e7:	b8 2e 07 00 00       	mov    $0x72e,%eax
   444ec:	e9 41 fe ff ff       	jmp    44332 <memusage::symbol_at(unsigned long) const+0xa6>
    auto v = v_[pa / PAGESIZE];
   444f1:	48 89 df             	mov    %rbx,%rdi
   444f4:	48 c1 ef 0c          	shr    $0xc,%rdi
   444f8:	49 8b 45 00          	mov    0x0(%r13),%rax
   444fc:	44 8b 3c b8          	mov    (%rax,%rdi,4),%r15d
        return lsb(v >> 3);
   44500:	44 89 f9             	mov    %r15d,%ecx
   44503:	c1 e9 03             	shr    $0x3,%ecx
   44506:	44 0f bc f1          	bsf    %ecx,%r14d
   4450a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   4450f:	44 0f 44 f0          	cmove  %eax,%r14d
   44513:	41 83 c6 01          	add    $0x1,%r14d
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   44517:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   4451c:	48 39 c3             	cmp    %rax,%rbx
   4451f:	0f 83 d4 fd ff ff    	jae    442f9 <memusage::symbol_at(unsigned long) const+0x6d>
    } else if (is_reserved && pid != 0) {
   44525:	85 c9                	test   %ecx,%ecx
   44527:	0f 95 45 cf          	setne  -0x31(%rbp)
   4452b:	e9 2d fe ff ff       	jmp    4435d <memusage::symbol_at(unsigned long) const+0xd1>

0000000000044530 <console_memviewer(proc*)>:
        console[CPOS(11 + pn/64, 12 + pn%64)] = ch;
    }
}


void console_memviewer(proc* vmp) {
   44530:	f3 0f 1e fa          	endbr64
   44534:	55                   	push   %rbp
   44535:	48 89 e5             	mov    %rsp,%rbp
   44538:	41 56                	push   %r14
   4453a:	41 55                	push   %r13
   4453c:	41 54                	push   %r12
   4453e:	53                   	push   %rbx
   4453f:	48 83 ec 20          	sub    $0x20,%rsp
    // Process 0 must never be used.
    assert(ptable[0].state == P_FREE);
   44543:	8b 1d e3 4c 01 00    	mov    0x14ce3(%rip),%ebx        # 5922c <ptable+0xc>
   44549:	85 db                	test   %ebx,%ebx
   4454b:	75 2e                	jne    4457b <console_memviewer(proc*)+0x4b>
   4454d:	49 89 fd             	mov    %rdi,%r13

    // track physical memory
    static memusage mu;
    mu.refresh();
   44550:	bf a0 01 06 00       	mov    $0x601a0,%edi
   44555:	e8 00 f8 ff ff       	call   43d5a <memusage::refresh()>

    // print physical memory
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY\n");
   4455a:	ba 09 59 04 00       	mov    $0x45909,%edx
   4455f:	be 00 0f 00 00       	mov    $0xf00,%esi
   44564:	bf 20 00 00 00       	mov    $0x20,%edi
   44569:	b8 00 00 00 00       	mov    $0x0,%eax
   4456e:	e8 0c 0f 00 00       	call   4547f <console_printf(int, int, char const*, ...)>
   44573:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   44579:	eb 6b                	jmp    445e6 <console_memviewer(proc*)+0xb6>
    assert(ptable[0].state == P_FREE);
   4457b:	b9 00 00 00 00       	mov    $0x0,%ecx
   44580:	ba ef 58 04 00       	mov    $0x458ef,%edx
   44585:	be 02 01 00 00       	mov    $0x102,%esi
   4458a:	bf 81 58 04 00       	mov    $0x45881,%edi
   4458f:	e8 90 e8 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>

    for (int pn = 0; pn * PAGESIZE < memusage::max_view_pa; ++pn) {
        if (pn % 64 == 0) {
            console_printf(CPOS(1 + pn/64, 3), 0x0F00, "0x%06X ", pn << 12);
        }
        console[CPOS(1 + pn/64, 12 + pn%64)] = mu.symbol_at(pn * PAGESIZE);
   44594:	8d 43 3f             	lea    0x3f(%rbx),%eax
   44597:	85 db                	test   %ebx,%ebx
   44599:	0f 49 c3             	cmovns %ebx,%eax
   4459c:	c1 f8 06             	sar    $0x6,%eax
   4459f:	8d 4c 80 05          	lea    0x5(%rax,%rax,4),%ecx
   445a3:	c1 e1 04             	shl    $0x4,%ecx
   445a6:	89 da                	mov    %ebx,%edx
   445a8:	c1 fa 1f             	sar    $0x1f,%edx
   445ab:	c1 ea 1a             	shr    $0x1a,%edx
   445ae:	8d 04 13             	lea    (%rbx,%rdx,1),%eax
   445b1:	83 e0 3f             	and    $0x3f,%eax
   445b4:	29 d0                	sub    %edx,%eax
   445b6:	44 8d 74 01 0c       	lea    0xc(%rcx,%rax,1),%r14d
   445bb:	4c 89 e6             	mov    %r12,%rsi
   445be:	bf a0 01 06 00       	mov    $0x601a0,%edi
   445c3:	e8 c4 fc ff ff       	call   4428c <memusage::symbol_at(unsigned long) const>
   445c8:	4d 63 f6             	movslq %r14d,%r14
   445cb:	66 43 89 84 36 00 80 	mov    %ax,0xb8000(%r14,%r14,1)
   445d2:	0b 00 
    for (int pn = 0; pn * PAGESIZE < memusage::max_view_pa; ++pn) {
   445d4:	83 c3 01             	add    $0x1,%ebx
   445d7:	49 81 c4 00 10 00 00 	add    $0x1000,%r12
   445de:	81 fb 00 02 00 00    	cmp    $0x200,%ebx
   445e4:	74 36                	je     4461c <console_memviewer(proc*)+0xec>
        if (pn % 64 == 0) {
   445e6:	f6 c3 3f             	test   $0x3f,%bl
   445e9:	75 a9                	jne    44594 <console_memviewer(proc*)+0x64>
            console_printf(CPOS(1 + pn/64, 3), 0x0F00, "0x%06X ", pn << 12);
   445eb:	8d 43 3f             	lea    0x3f(%rbx),%eax
   445ee:	85 db                	test   %ebx,%ebx
   445f0:	0f 49 c3             	cmovns %ebx,%eax
   445f3:	c1 f8 06             	sar    $0x6,%eax
   445f6:	8d 7c 80 05          	lea    0x5(%rax,%rax,4),%edi
   445fa:	c1 e7 04             	shl    $0x4,%edi
   445fd:	83 c7 03             	add    $0x3,%edi
   44600:	44 89 e1             	mov    %r12d,%ecx
   44603:	ba 1a 59 04 00       	mov    $0x4591a,%edx
   44608:	be 00 0f 00 00       	mov    $0xf00,%esi
   4460d:	b8 00 00 00 00       	mov    $0x0,%eax
   44612:	e8 68 0e 00 00       	call   4547f <console_printf(int, int, char const*, ...)>
   44617:	e9 78 ff ff ff       	jmp    44594 <console_memviewer(proc*)+0x64>
    }

    // print virtual memory
    if (vmp) {
   4461c:	4d 85 ed             	test   %r13,%r13
   4461f:	0f 84 ea 01 00 00    	je     4480f <console_memviewer(proc*)+0x2df>
    assert(vmp->pagetable != nullptr);
   44625:	49 83 7d 00 00       	cmpq   $0x0,0x0(%r13)
   4462a:	0f 84 87 00 00 00    	je     446b7 <console_memviewer(proc*)+0x187>
    const char* statemsg = vmp->state == P_FAULTED ? " (faulted)" : "";
   44630:	41 83 7d 0c 03       	cmpl   $0x3,0xc(%r13)
    console_printf(CPOS(10, 26), 0x0F00,
   44635:	41 8b 4d 08          	mov    0x8(%r13),%ecx
   44639:	41 b9 09 58 04 00    	mov    $0x45809,%r9d
   4463f:	b8 e4 58 04 00       	mov    $0x458e4,%eax
   44644:	4c 0f 44 c8          	cmove  %rax,%r9
   44648:	41 b8 00 07 00 00    	mov    $0x700,%r8d
   4464e:	ba e8 5e 04 00       	mov    $0x45ee8,%edx
   44653:	be 00 0f 00 00       	mov    $0xf00,%esi
   44658:	bf 3a 03 00 00       	mov    $0x33a,%edi
   4465d:	b8 00 00 00 00       	mov    $0x0,%eax
   44662:	e8 18 0e 00 00       	call   4547f <console_printf(int, int, char const*, ...)>
    : vmiter(p->pagetable, va) {
   44667:	49 8b 45 00          	mov    0x0(%r13),%rax
    : pt_(pt), pep_(&pt_->entry[0]), level_(3), perm_(initial_perm), va_(0) {
   4466b:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   4466f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
   44673:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%rbp)
   4467a:	c7 45 d4 ff 0f 00 00 	movl   $0xfff,-0x2c(%rbp)
   44681:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
   44688:	00 
    real_find(va);
   44689:	be 00 00 00 00       	mov    $0x0,%esi
   4468e:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   44692:	e8 d5 d9 ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   44697:	48 8b 5d d8          	mov    -0x28(%rbp),%rbx
         it.va() < memusage::max_view_va;
   4469b:	48 81 fb ff ff 2f 00 	cmp    $0x2fffff,%rbx
   446a2:	0f 87 67 01 00 00    	ja     4480f <console_memviewer(proc*)+0x2df>
            pa &= ~0x1000UL;
   446a8:	49 bd 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r13
   446af:	ff 0f 00 
   446b2:	e9 d2 00 00 00       	jmp    44789 <console_memviewer(proc*)+0x259>
    assert(vmp->pagetable != nullptr);
   446b7:	b9 00 00 00 00       	mov    $0x0,%ecx
   446bc:	ba 22 59 04 00       	mov    $0x45922,%edx
   446c1:	be de 00 00 00       	mov    $0xde,%esi
   446c6:	bf 81 58 04 00       	mov    $0x45881,%edi
   446cb:	e8 54 e7 ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
            console_printf(CPOS(11 + pn / 64, 3), 0x0F00,
   446d0:	48 89 d8             	mov    %rbx,%rax
   446d3:	48 c1 e8 12          	shr    $0x12,%rax
   446d7:	8d 3c 80             	lea    (%rax,%rax,4),%edi
   446da:	c1 e7 04             	shl    $0x4,%edi
   446dd:	81 c7 73 03 00 00    	add    $0x373,%edi
   446e3:	48 89 d9             	mov    %rbx,%rcx
   446e6:	ba 1a 59 04 00       	mov    $0x4591a,%edx
   446eb:	be 00 0f 00 00       	mov    $0xf00,%esi
   446f0:	b8 00 00 00 00       	mov    $0x0,%eax
   446f5:	e8 85 0d 00 00       	call   4547f <console_printf(int, int, char const*, ...)>
   446fa:	e9 9b 00 00 00       	jmp    4479a <console_memviewer(proc*)+0x26a>
   446ff:	8d 4c c0 0c          	lea    0xc(%rax,%rax,8),%ecx
        return pa + (va_ & pageoffmask(level_));
   44703:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   4470a:	48 d3 e0             	shl    %cl,%rax
   4470d:	48 89 c6             	mov    %rax,%rsi
   44710:	48 f7 d6             	not    %rsi
   44713:	48 23 75 d8          	and    -0x28(%rbp),%rsi
   44717:	48 01 d6             	add    %rdx,%rsi
            ch = mu.symbol_at(it.pa());
   4471a:	bf a0 01 06 00       	mov    $0x601a0,%edi
   4471f:	e8 68 fb ff ff       	call   4428c <memusage::symbol_at(unsigned long) const>
   44724:	89 c2                	mov    %eax,%edx
    uint64_t ph = *pep_ & perm_;
   44726:	48 63 4d d4          	movslq -0x2c(%rbp),%rcx
   4472a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4472e:	48 23 08             	and    (%rax),%rcx
    return ph & -(ph & PTE_P);
   44731:	48 89 c8             	mov    %rcx,%rax
   44734:	83 e0 01             	and    $0x1,%eax
   44737:	48 f7 d8             	neg    %rax
   4473a:	48 21 c8             	and    %rcx,%rax
            if (it.user()) { // switch foreground & background colors
   4473d:	48 f7 d0             	not    %rax
   44740:	a8 05                	test   $0x5,%al
   44742:	0f 84 9c 00 00 00    	je     447e4 <console_memviewer(proc*)+0x2b4>
        console[CPOS(11 + pn/64, 12 + pn%64)] = ch;
   44748:	48 c1 eb 12          	shr    $0x12,%rbx
   4474c:	48 8d 04 9b          	lea    (%rbx,%rbx,4),%rax
   44750:	48 c1 e0 04          	shl    $0x4,%rax
   44754:	49 8d 84 04 7c 03 00 	lea    0x37c(%r12,%rax,1),%rax
   4475b:	00 
   4475c:	66 89 94 00 00 80 0b 	mov    %dx,0xb8000(%rax,%rax,1)
   44763:	00 
    return find(va_ + delta);
   44764:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   44768:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va);
   4476f:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   44773:	e8 f4 d8 ff ff       	call   4206c <vmiter::real_find(unsigned long)>
    return va_;
   44778:	48 8b 5d d8          	mov    -0x28(%rbp),%rbx
         it.va() < memusage::max_view_va;
   4477c:	48 81 fb ff ff 2f 00 	cmp    $0x2fffff,%rbx
   44783:	0f 87 86 00 00 00    	ja     4480f <console_memviewer(proc*)+0x2df>
        unsigned long pn = it.va() / PAGESIZE;
   44789:	49 89 dc             	mov    %rbx,%r12
   4478c:	49 c1 ec 0c          	shr    $0xc,%r12
        if (pn % 64 == 0) {
   44790:	41 83 e4 3f          	and    $0x3f,%r12d
   44794:	0f 84 36 ff ff ff    	je     446d0 <console_memviewer(proc*)+0x1a0>
    uint64_t ph = *pep_ & perm_;
   4479a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4479e:	48 8b 08             	mov    (%rax),%rcx
   447a1:	48 63 45 d4          	movslq -0x2c(%rbp),%rax
   447a5:	48 21 c8             	and    %rcx,%rax
            ch = ' ';
   447a8:	ba 20 00 00 00       	mov    $0x20,%edx
        if (!it.present()) {
   447ad:	a8 01                	test   $0x1,%al
   447af:	74 97                	je     44748 <console_memviewer(proc*)+0x218>
        return -1;
   447b1:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
    if (*pep_ & PTE_P) {
   447b8:	f6 c1 01             	test   $0x1,%cl
   447bb:	0f 84 59 ff ff ff    	je     4471a <console_memviewer(proc*)+0x1ea>
        if (level_ > 0) {
   447c1:	8b 45 d0             	mov    -0x30(%rbp),%eax
            pa &= ~0x1000UL;
   447c4:	48 89 ca             	mov    %rcx,%rdx
   447c7:	4c 21 ea             	and    %r13,%rdx
        if (level_ > 0) {
   447ca:	85 c0                	test   %eax,%eax
   447cc:	0f 8f 2d ff ff ff    	jg     446ff <console_memviewer(proc*)+0x1cf>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   447d2:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   447d9:	ff 0f 00 
   447dc:	48 21 ca             	and    %rcx,%rdx
   447df:	e9 1b ff ff ff       	jmp    446ff <console_memviewer(proc*)+0x1cf>
                if (ch == (0x0F00 | 'S')) {
   447e4:	66 81 fa 53 0f       	cmp    $0xf53,%dx
   447e9:	74 1a                	je     44805 <console_memviewer(proc*)+0x2d5>
                    uint16_t z = (ch & 0x0F00) ^ ((ch & 0xF000) >> 4);
   447eb:	89 d0                	mov    %edx,%eax
   447ed:	66 c1 e8 04          	shr    $0x4,%ax
   447f1:	31 d0                	xor    %edx,%eax
   447f3:	66 25 00 0f          	and    $0xf00,%ax
   447f7:	89 c1                	mov    %eax,%ecx
   447f9:	c1 e1 04             	shl    $0x4,%ecx
   447fc:	01 c8                	add    %ecx,%eax
                    ch ^= z | (z << 4);
   447fe:	31 c2                	xor    %eax,%edx
   44800:	e9 43 ff ff ff       	jmp    44748 <console_memviewer(proc*)+0x218>
                    ch ^= 0xFE00;
   44805:	ba 53 f1 ff ff       	mov    $0xfffff153,%edx
   4480a:	e9 39 ff ff ff       	jmp    44748 <console_memviewer(proc*)+0x218>
        console_memviewer_virtual(mu, vmp);
    }
}
   4480f:	48 83 c4 20          	add    $0x20,%rsp
   44813:	5b                   	pop    %rbx
   44814:	41 5c                	pop    %r12
   44816:	41 5d                	pop    %r13
   44818:	41 5e                	pop    %r14
   4481a:	5d                   	pop    %rbp
   4481b:	c3                   	ret

000000000004481c <memcpy>:
// memcpy, memmove, memset, memcmp, memchr, strlen, strnlen,
// strcpy, strncpy, strlcpy, strcmp, strncmp, strchr, strstr,
// strtoul, strtol
//    We must provide our own implementations.

void* memcpy(void* dst, const void* src, size_t n) {
   4481c:	f3 0f 1e fa          	endbr64
   44820:	48 89 f8             	mov    %rdi,%rax
    const char* s = (const char*) src;
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   44823:	48 85 d2             	test   %rdx,%rdx
   44826:	74 17                	je     4483f <memcpy+0x23>
   44828:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
   4482d:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
   44832:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   44836:	48 83 c1 01          	add    $0x1,%rcx
   4483a:	48 39 d1             	cmp    %rdx,%rcx
   4483d:	75 ee                	jne    4482d <memcpy+0x11>
    }
    return dst;
}
   4483f:	c3                   	ret

0000000000044840 <memset>:
        }
    }
    return dst;
}

void* memset(void* v, int c, size_t n) {
   44840:	f3 0f 1e fa          	endbr64
   44844:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
   44847:	48 85 d2             	test   %rdx,%rdx
   4484a:	74 12                	je     4485e <memset+0x1e>
   4484c:	48 01 fa             	add    %rdi,%rdx
   4484f:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
   44852:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   44855:	48 83 c1 01          	add    $0x1,%rcx
   44859:	48 39 ca             	cmp    %rcx,%rdx
   4485c:	75 f4                	jne    44852 <memset+0x12>
    }
    return v;
}
   4485e:	c3                   	ret

000000000004485f <strlen>:
        }
    }
    return nullptr;
}

size_t strlen(const char* s) {
   4485f:	f3 0f 1e fa          	endbr64
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
   44863:	80 3f 00             	cmpb   $0x0,(%rdi)
   44866:	74 10                	je     44878 <strlen+0x19>
   44868:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
   4486d:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
   44871:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
   44875:	75 f6                	jne    4486d <strlen+0xe>
   44877:	c3                   	ret
   44878:	b8 00 00 00 00       	mov    $0x0,%eax
    }
    return n;
}
   4487d:	c3                   	ret

000000000004487e <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
   4487e:	f3 0f 1e fa          	endbr64
   44882:	48 89 f0             	mov    %rsi,%rax
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   44885:	ba 00 00 00 00       	mov    $0x0,%edx
   4488a:	48 85 f6             	test   %rsi,%rsi
   4488d:	74 10                	je     4489f <strnlen+0x21>
   4488f:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
   44893:	74 0b                	je     448a0 <strnlen+0x22>
        ++n;
   44895:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   44899:	48 39 d0             	cmp    %rdx,%rax
   4489c:	75 f1                	jne    4488f <strnlen+0x11>
   4489e:	c3                   	ret
   4489f:	c3                   	ret
   448a0:	48 89 d0             	mov    %rdx,%rax
    }
    return n;
}
   448a3:	c3                   	ret

00000000000448a4 <strcmp>:
        dst[nn] = '\0';
    }
    return n;
}

int strcmp(const char* a, const char* b) {
   448a4:	f3 0f 1e fa          	endbr64
    while (true) {
        unsigned char ac = *a, bc = *b;
   448a8:	0f b6 17             	movzbl (%rdi),%edx
   448ab:	0f b6 0e             	movzbl (%rsi),%ecx
        if (ac == '\0' || bc == '\0' || ac != bc) {
   448ae:	84 d2                	test   %dl,%dl
   448b0:	0f 94 c0             	sete   %al
   448b3:	38 ca                	cmp    %cl,%dl
   448b5:	41 0f 95 c0          	setne  %r8b
   448b9:	44 08 c0             	or     %r8b,%al
   448bc:	75 2a                	jne    448e8 <strcmp+0x44>
   448be:	b8 01 00 00 00       	mov    $0x1,%eax
   448c3:	84 c9                	test   %cl,%cl
   448c5:	74 21                	je     448e8 <strcmp+0x44>
        unsigned char ac = *a, bc = *b;
   448c7:	0f b6 14 07          	movzbl (%rdi,%rax,1),%edx
   448cb:	0f b6 0c 06          	movzbl (%rsi,%rax,1),%ecx
        if (ac == '\0' || bc == '\0' || ac != bc) {
   448cf:	48 83 c0 01          	add    $0x1,%rax
   448d3:	84 d2                	test   %dl,%dl
   448d5:	41 0f 94 c0          	sete   %r8b
   448d9:	84 c9                	test   %cl,%cl
   448db:	41 0f 94 c1          	sete   %r9b
   448df:	45 08 c8             	or     %r9b,%r8b
   448e2:	75 04                	jne    448e8 <strcmp+0x44>
   448e4:	38 ca                	cmp    %cl,%dl
   448e6:	74 df                	je     448c7 <strcmp+0x23>
            return (ac > bc) - (ac < bc);
   448e8:	38 d1                	cmp    %dl,%cl
   448ea:	0f 92 c0             	setb   %al
   448ed:	0f b6 c0             	movzbl %al,%eax
   448f0:	38 ca                	cmp    %cl,%dl
   448f2:	83 d8 00             	sbb    $0x0,%eax
        }
        ++a, ++b;
    }
}
   448f5:	c3                   	ret

00000000000448f6 <strchr>:
        }
        ++a, ++b, --n;
    }
}

char* strchr(const char* s, int c) {
   448f6:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
   448fa:	0f b6 07             	movzbl (%rdi),%eax
   448fd:	84 c0                	test   %al,%al
   448ff:	74 10                	je     44911 <strchr+0x1b>
   44901:	40 38 f0             	cmp    %sil,%al
   44904:	74 18                	je     4491e <strchr+0x28>
        ++s;
   44906:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
   4490a:	0f b6 07             	movzbl (%rdi),%eax
   4490d:	84 c0                	test   %al,%al
   4490f:	75 f0                	jne    44901 <strchr+0xb>
    }
    if (*s == (char) c) {
        return (char*) s;
   44911:	40 84 f6             	test   %sil,%sil
   44914:	b8 00 00 00 00       	mov    $0x0,%eax
   44919:	48 0f 44 c7          	cmove  %rdi,%rax
    } else {
        return nullptr;
    }
}
   4491d:	c3                   	ret
        return (char*) s;
   4491e:	48 89 f8             	mov    %rdi,%rax
   44921:	c3                   	ret

0000000000044922 <strstr>:

char* strstr(const char* hs, const char* ns) {
   44922:	f3 0f 1e fa          	endbr64
    size_t i = 0, j = 0;
    while (hs[i] != '\0' && ns[j] != '\0') {
   44926:	49 89 f8             	mov    %rdi,%r8
    size_t i = 0, j = 0;
   44929:	b8 00 00 00 00       	mov    $0x0,%eax
   4492e:	ba 00 00 00 00       	mov    $0x0,%edx
    while (hs[i] != '\0' && ns[j] != '\0') {
   44933:	80 3f 00             	cmpb   $0x0,(%rdi)
   44936:	75 1f                	jne    44957 <strstr+0x35>
        }
    }
    if (ns[j] == '\0') {
        return const_cast<char*>(&hs[i]);
    } else {
        return nullptr;
   44938:	80 3c 06 00          	cmpb   $0x0,(%rsi,%rax,1)
   4493c:	b8 00 00 00 00       	mov    $0x0,%eax
   44941:	4c 0f 45 c0          	cmovne %rax,%r8
    }
}
   44945:	4c 89 c0             	mov    %r8,%rax
   44948:	c3                   	ret
            ++j;
   44949:	48 83 c0 01          	add    $0x1,%rax
    while (hs[i] != '\0' && ns[j] != '\0') {
   4494d:	4c 8d 04 17          	lea    (%rdi,%rdx,1),%r8
   44951:	41 80 38 00          	cmpb   $0x0,(%r8)
   44955:	74 e1                	je     44938 <strstr+0x16>
   44957:	0f b6 0c 06          	movzbl (%rsi,%rax,1),%ecx
   4495b:	84 c9                	test   %cl,%cl
   4495d:	74 e6                	je     44945 <strstr+0x23>
        if (hs[i + j] == ns[j]) {
   4495f:	4c 8d 04 17          	lea    (%rdi,%rdx,1),%r8
   44963:	41 38 0c 00          	cmp    %cl,(%r8,%rax,1)
   44967:	74 e0                	je     44949 <strstr+0x27>
            ++i;
   44969:	48 83 c2 01          	add    $0x1,%rdx
            j = 0;
   4496d:	b8 00 00 00 00       	mov    $0x0,%eax
   44972:	eb d9                	jmp    4494d <strstr+0x2b>

0000000000044974 <printer::vprintf(int, char const*, __va_list_tag*)>:
        }
    } while (val != 0 && pos != buf);
    return pos;
}

void printer::vprintf(int color, const char* format, va_list val) {
   44974:	f3 0f 1e fa          	endbr64
   44978:	55                   	push   %rbp
   44979:	48 89 e5             	mov    %rsp,%rbp
   4497c:	41 57                	push   %r15
   4497e:	41 56                	push   %r14
   44980:	41 55                	push   %r13
   44982:	41 54                	push   %r12
   44984:	53                   	push   %rbx
   44985:	48 83 ec 58          	sub    $0x58,%rsp
   44989:	49 89 ff             	mov    %rdi,%r15
   4498c:	41 89 f5             	mov    %esi,%r13d
   4498f:	49 89 d4             	mov    %rdx,%r12
   44992:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
#define NUMBUFSIZ 32
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
   44996:	0f b6 02             	movzbl (%rdx),%eax
   44999:	84 c0                	test   %al,%al
   4499b:	0f 85 aa 05 00 00    	jne    44f4b <printer::vprintf(int, char const*, __va_list_tag*)+0x5d7>
        }
        for (; width > 0; --width) {
            putc(' ', color);
        }
    }
}
   449a1:	48 83 c4 58          	add    $0x58,%rsp
   449a5:	5b                   	pop    %rbx
   449a6:	41 5c                	pop    %r12
   449a8:	41 5d                	pop    %r13
   449aa:	41 5e                	pop    %r14
   449ac:	41 5f                	pop    %r15
   449ae:	5d                   	pop    %rbp
   449af:	c3                   	ret
        for (++format; *format; ++format) {
   449b0:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
   449b5:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
   449bb:	45 84 e4             	test   %r12b,%r12b
   449be:	0f 84 08 01 00 00    	je     44acc <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
        int flags = 0;
   449c4:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
   449ca:	41 0f be f4          	movsbl %r12b,%esi
   449ce:	bf 61 68 04 00       	mov    $0x46861,%edi
   449d3:	e8 1e ff ff ff       	call   448f6 <strchr>
   449d8:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
   449db:	48 85 c0             	test   %rax,%rax
   449de:	74 74                	je     44a54 <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
   449e0:	48 81 e9 61 68 04 00 	sub    $0x46861,%rcx
   449e7:	b8 01 00 00 00       	mov    $0x1,%eax
   449ec:	d3 e0                	shl    %cl,%eax
   449ee:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
   449f1:	48 83 c3 01          	add    $0x1,%rbx
   449f5:	44 0f b6 23          	movzbl (%rbx),%r12d
   449f9:	45 84 e4             	test   %r12b,%r12b
   449fc:	75 cc                	jne    449ca <printer::vprintf(int, char const*, __va_list_tag*)+0x56>
        int width = -1;
   449fe:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
   44a02:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
        int precision = -1;
   44a08:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,-0x60(%rbp)
        if (*format == '.') {
   44a0f:	80 3b 2e             	cmpb   $0x2e,(%rbx)
   44a12:	0f 84 dc 00 00 00    	je     44af4 <printer::vprintf(int, char const*, __va_list_tag*)+0x180>
        switch (*format) {
   44a18:	0f b6 03             	movzbl (%rbx),%eax
   44a1b:	3c 6c                	cmp    $0x6c,%al
   44a1d:	0f 84 77 01 00 00    	je     44b9a <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
   44a23:	0f 8f 52 01 00 00    	jg     44b7b <printer::vprintf(int, char const*, __va_list_tag*)+0x207>
   44a29:	3c 68                	cmp    $0x68,%al
   44a2b:	0f 85 8c 01 00 00    	jne    44bbd <printer::vprintf(int, char const*, __va_list_tag*)+0x249>
            ++format;
   44a31:	48 8d 43 01          	lea    0x1(%rbx),%rax
   44a35:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
   44a39:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   44a3d:	8d 50 bd             	lea    -0x43(%rax),%edx
   44a40:	80 fa 35             	cmp    $0x35,%dl
   44a43:	0f 87 b8 05 00 00    	ja     45001 <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
   44a49:	0f b6 d2             	movzbl %dl,%edx
   44a4c:	3e ff 24 d5 70 61 04 	notrack jmp *0x46170(,%rdx,8)
   44a53:	00 
        if (*format >= '1' && *format <= '9') {
   44a54:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
   44a58:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
   44a5d:	3c 08                	cmp    $0x8,%al
   44a5f:	77 31                	ja     44a92 <printer::vprintf(int, char const*, __va_list_tag*)+0x11e>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   44a61:	0f b6 03             	movzbl (%rbx),%eax
   44a64:	8d 50 d0             	lea    -0x30(%rax),%edx
   44a67:	80 fa 09             	cmp    $0x9,%dl
   44a6a:	77 72                	ja     44ade <printer::vprintf(int, char const*, __va_list_tag*)+0x16a>
   44a6c:	41 be 00 00 00 00    	mov    $0x0,%r14d
                width = 10 * width + *format++ - '0';
   44a72:	48 83 c3 01          	add    $0x1,%rbx
   44a76:	43 8d 14 b6          	lea    (%r14,%r14,4),%edx
   44a7a:	0f be c0             	movsbl %al,%eax
   44a7d:	44 8d 74 50 d0       	lea    -0x30(%rax,%rdx,2),%r14d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   44a82:	0f b6 03             	movzbl (%rbx),%eax
   44a85:	8d 50 d0             	lea    -0x30(%rax),%edx
   44a88:	80 fa 09             	cmp    $0x9,%dl
   44a8b:	76 e5                	jbe    44a72 <printer::vprintf(int, char const*, __va_list_tag*)+0xfe>
   44a8d:	e9 76 ff ff ff       	jmp    44a08 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        } else if (*format == '*') {
   44a92:	41 80 fc 2a          	cmp    $0x2a,%r12b
   44a96:	75 51                	jne    44ae9 <printer::vprintf(int, char const*, __va_list_tag*)+0x175>
            width = va_arg(val, int);
   44a98:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44a9c:	8b 01                	mov    (%rcx),%eax
   44a9e:	83 f8 2f             	cmp    $0x2f,%eax
   44aa1:	77 17                	ja     44aba <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
   44aa3:	89 c2                	mov    %eax,%edx
   44aa5:	48 03 51 10          	add    0x10(%rcx),%rdx
   44aa9:	83 c0 08             	add    $0x8,%eax
   44aac:	89 01                	mov    %eax,(%rcx)
   44aae:	44 8b 32             	mov    (%rdx),%r14d
            ++format;
   44ab1:	48 83 c3 01          	add    $0x1,%rbx
   44ab5:	e9 4e ff ff ff       	jmp    44a08 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            width = va_arg(val, int);
   44aba:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44abe:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   44ac2:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44ac6:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44aca:	eb e2                	jmp    44aae <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
        int flags = 0;
   44acc:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
        int width = -1;
   44ad3:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
   44ad9:	e9 2a ff ff ff       	jmp    44a08 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   44ade:	41 be 00 00 00 00    	mov    $0x0,%r14d
   44ae4:	e9 1f ff ff ff       	jmp    44a08 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        int width = -1;
   44ae9:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
   44aef:	e9 14 ff ff ff       	jmp    44a08 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            ++format;
   44af4:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
   44af8:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   44afc:	8d 48 d0             	lea    -0x30(%rax),%ecx
   44aff:	80 f9 09             	cmp    $0x9,%cl
   44b02:	76 13                	jbe    44b17 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a3>
            } else if (*format == '*') {
   44b04:	3c 2a                	cmp    $0x2a,%al
   44b06:	74 33                	je     44b3b <printer::vprintf(int, char const*, __va_list_tag*)+0x1c7>
            ++format;
   44b08:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
   44b0b:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
   44b12:	e9 01 ff ff ff       	jmp    44a18 <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   44b17:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
   44b1c:	48 83 c2 01          	add    $0x1,%rdx
   44b20:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
   44b23:	0f be c0             	movsbl %al,%eax
   44b26:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   44b2a:	0f b6 02             	movzbl (%rdx),%eax
   44b2d:	8d 70 d0             	lea    -0x30(%rax),%esi
   44b30:	40 80 fe 09          	cmp    $0x9,%sil
   44b34:	76 e6                	jbe    44b1c <printer::vprintf(int, char const*, __va_list_tag*)+0x1a8>
   44b36:	48 89 d3             	mov    %rdx,%rbx
   44b39:	eb 1c                	jmp    44b57 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e3>
                precision = va_arg(val, int);
   44b3b:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44b3f:	8b 01                	mov    (%rcx),%eax
   44b41:	83 f8 2f             	cmp    $0x2f,%eax
   44b44:	77 23                	ja     44b69 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
   44b46:	89 c2                	mov    %eax,%edx
   44b48:	48 03 51 10          	add    0x10(%rcx),%rdx
   44b4c:	83 c0 08             	add    $0x8,%eax
   44b4f:	89 01                	mov    %eax,(%rcx)
   44b51:	8b 0a                	mov    (%rdx),%ecx
                ++format;
   44b53:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
   44b57:	85 c9                	test   %ecx,%ecx
   44b59:	b8 00 00 00 00       	mov    $0x0,%eax
   44b5e:	0f 49 c1             	cmovns %ecx,%eax
   44b61:	89 45 a0             	mov    %eax,-0x60(%rbp)
   44b64:	e9 af fe ff ff       	jmp    44a18 <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                precision = va_arg(val, int);
   44b69:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44b6d:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   44b71:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44b75:	48 89 41 08          	mov    %rax,0x8(%rcx)
   44b79:	eb d6                	jmp    44b51 <printer::vprintf(int, char const*, __va_list_tag*)+0x1dd>
        switch (*format) {
   44b7b:	3c 74                	cmp    $0x74,%al
   44b7d:	74 1b                	je     44b9a <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
   44b7f:	3c 7a                	cmp    $0x7a,%al
   44b81:	74 17                	je     44b9a <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
        switch (*format) {
   44b83:	8d 50 bd             	lea    -0x43(%rax),%edx
   44b86:	80 fa 35             	cmp    $0x35,%dl
   44b89:	0f 87 6f 06 00 00    	ja     451fe <printer::vprintf(int, char const*, __va_list_tag*)+0x88a>
   44b8f:	0f b6 d2             	movzbl %dl,%edx
   44b92:	3e ff 24 d5 20 63 04 	notrack jmp *0x46320(,%rdx,8)
   44b99:	00 
            ++format;
   44b9a:	48 8d 43 01          	lea    0x1(%rbx),%rax
   44b9e:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
   44ba2:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   44ba6:	8d 50 bd             	lea    -0x43(%rax),%edx
   44ba9:	80 fa 35             	cmp    $0x35,%dl
   44bac:	0f 87 4f 04 00 00    	ja     45001 <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
   44bb2:	0f b6 d2             	movzbl %dl,%edx
   44bb5:	3e ff 24 d5 d0 64 04 	notrack jmp *0x464d0(,%rdx,8)
   44bbc:	00 
   44bbd:	8d 50 bd             	lea    -0x43(%rax),%edx
   44bc0:	80 fa 35             	cmp    $0x35,%dl
   44bc3:	0f 87 34 04 00 00    	ja     44ffd <printer::vprintf(int, char const*, __va_list_tag*)+0x689>
   44bc9:	0f b6 d2             	movzbl %dl,%edx
   44bcc:	3e ff 24 d5 80 66 04 	notrack jmp *0x46680(,%rdx,8)
   44bd3:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
   44bd4:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44bd8:	8b 07                	mov    (%rdi),%eax
   44bda:	83 f8 2f             	cmp    $0x2f,%eax
   44bdd:	77 38                	ja     44c17 <printer::vprintf(int, char const*, __va_list_tag*)+0x2a3>
   44bdf:	89 c2                	mov    %eax,%edx
   44be1:	48 03 57 10          	add    0x10(%rdi),%rdx
   44be5:	83 c0 08             	add    $0x8,%eax
   44be8:	89 07                	mov    %eax,(%rdi)
   44bea:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   44bed:	48 89 d0             	mov    %rdx,%rax
   44bf0:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
   44bf4:	49 89 d3             	mov    %rdx,%r11
   44bf7:	49 f7 db             	neg    %r11
   44bfa:	25 00 01 00 00       	and    $0x100,%eax
   44bff:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   44c03:	8b 7d a4             	mov    -0x5c(%rbp),%edi
   44c06:	09 f8                	or     %edi,%eax
   44c08:	0c c0                	or     $0xc0,%al
   44c0a:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        const char* data = "";
   44c0d:	bb 09 58 04 00       	mov    $0x45809,%ebx
            break;
   44c12:	e9 f4 01 00 00       	jmp    44e0b <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   44c17:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
   44c1b:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   44c1f:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44c23:	48 89 43 08          	mov    %rax,0x8(%rbx)
   44c27:	eb c1                	jmp    44bea <printer::vprintf(int, char const*, __va_list_tag*)+0x276>
        switch (*format) {
   44c29:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44c2d:	eb 04                	jmp    44c33 <printer::vprintf(int, char const*, __va_list_tag*)+0x2bf>
   44c2f:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
   44c33:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44c37:	8b 01                	mov    (%rcx),%eax
   44c39:	83 f8 2f             	cmp    $0x2f,%eax
   44c3c:	77 10                	ja     44c4e <printer::vprintf(int, char const*, __va_list_tag*)+0x2da>
   44c3e:	89 c2                	mov    %eax,%edx
   44c40:	48 03 51 10          	add    0x10(%rcx),%rdx
   44c44:	83 c0 08             	add    $0x8,%eax
   44c47:	89 01                	mov    %eax,(%rcx)
   44c49:	48 63 12             	movslq (%rdx),%rdx
   44c4c:	eb 9f                	jmp    44bed <printer::vprintf(int, char const*, __va_list_tag*)+0x279>
   44c4e:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44c52:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   44c56:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44c5a:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44c5e:	eb e9                	jmp    44c49 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d5>
        switch (*format) {
   44c60:	b8 01 00 00 00       	mov    $0x1,%eax
   44c65:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
   44c6c:	e9 9d 00 00 00       	jmp    44d0e <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
   44c71:	b8 00 00 00 00       	mov    $0x0,%eax
   44c76:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
   44c7d:	e9 8c 00 00 00       	jmp    44d0e <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
   44c82:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44c86:	b8 00 00 00 00       	mov    $0x0,%eax
   44c8b:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
   44c92:	eb 7a                	jmp    44d0e <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
   44c94:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44c98:	b8 00 00 00 00       	mov    $0x0,%eax
   44c9d:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
   44ca4:	eb 68                	jmp    44d0e <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   44ca6:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44caa:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   44cae:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44cb2:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44cb6:	eb 70                	jmp    44d28 <printer::vprintf(int, char const*, __va_list_tag*)+0x3b4>
   44cb8:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44cbc:	8b 01                	mov    (%rcx),%eax
   44cbe:	83 f8 2f             	cmp    $0x2f,%eax
   44cc1:	77 10                	ja     44cd3 <printer::vprintf(int, char const*, __va_list_tag*)+0x35f>
   44cc3:	89 c2                	mov    %eax,%edx
   44cc5:	48 03 51 10          	add    0x10(%rcx),%rdx
   44cc9:	83 c0 08             	add    $0x8,%eax
   44ccc:	89 01                	mov    %eax,(%rcx)
   44cce:	44 8b 1a             	mov    (%rdx),%r11d
   44cd1:	eb 58                	jmp    44d2b <printer::vprintf(int, char const*, __va_list_tag*)+0x3b7>
   44cd3:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44cd7:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   44cdb:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44cdf:	48 89 41 08          	mov    %rax,0x8(%rcx)
   44ce3:	eb e9                	jmp    44cce <printer::vprintf(int, char const*, __va_list_tag*)+0x35a>
        switch (*format) {
   44ce5:	b8 01 00 00 00       	mov    $0x1,%eax
   44cea:	eb 1b                	jmp    44d07 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
   44cec:	b8 00 00 00 00       	mov    $0x0,%eax
   44cf1:	eb 14                	jmp    44d07 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
   44cf3:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44cf7:	b8 00 00 00 00       	mov    $0x0,%eax
   44cfc:	eb 09                	jmp    44d07 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
   44cfe:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44d02:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
   44d07:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   44d0e:	85 c0                	test   %eax,%eax
   44d10:	74 a6                	je     44cb8 <printer::vprintf(int, char const*, __va_list_tag*)+0x344>
   44d12:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44d16:	8b 07                	mov    (%rdi),%eax
   44d18:	83 f8 2f             	cmp    $0x2f,%eax
   44d1b:	77 89                	ja     44ca6 <printer::vprintf(int, char const*, __va_list_tag*)+0x332>
   44d1d:	89 c2                	mov    %eax,%edx
   44d1f:	48 03 57 10          	add    0x10(%rdi),%rdx
   44d23:	83 c0 08             	add    $0x8,%eax
   44d26:	89 07                	mov    %eax,(%rdi)
   44d28:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
   44d2b:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   44d2e:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
   44d31:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
   44d35:	0f 89 ea 02 00 00    	jns    45025 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
    *--pos = '\0';
   44d3b:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
   44d3f:	a8 20                	test   $0x20,%al
   44d41:	0f 85 0d 03 00 00    	jne    45054 <printer::vprintf(int, char const*, __va_list_tag*)+0x6e0>
   44d47:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
   44d4a:	41 ba 30 68 04 00    	mov    $0x46830,%r10d
        base = -base;
   44d50:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
   44d56:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
   44d5d:	bf 00 00 00 00       	mov    $0x0,%edi
   44d62:	e9 0f 03 00 00       	jmp    45076 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
        switch (*format) {
   44d67:	b8 01 00 00 00       	mov    $0x1,%eax
   44d6c:	eb 1b                	jmp    44d89 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
   44d6e:	b8 00 00 00 00       	mov    $0x0,%eax
   44d73:	eb 14                	jmp    44d89 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
   44d75:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44d79:	b8 00 00 00 00       	mov    $0x0,%eax
   44d7e:	eb 09                	jmp    44d89 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
   44d80:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44d84:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
   44d89:	c7 45 9c 10 00 00 00 	movl   $0x10,-0x64(%rbp)
            goto format_unsigned;
   44d90:	e9 79 ff ff ff       	jmp    44d0e <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
        switch (*format) {
   44d95:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44d99:	eb 04                	jmp    44d9f <printer::vprintf(int, char const*, __va_list_tag*)+0x42b>
   44d9b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
   44d9f:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44da3:	8b 01                	mov    (%rcx),%eax
   44da5:	83 f8 2f             	cmp    $0x2f,%eax
   44da8:	77 22                	ja     44dcc <printer::vprintf(int, char const*, __va_list_tag*)+0x458>
   44daa:	89 c2                	mov    %eax,%edx
   44dac:	48 03 51 10          	add    0x10(%rcx),%rdx
   44db0:	83 c0 08             	add    $0x8,%eax
   44db3:	89 01                	mov    %eax,(%rcx)
   44db5:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   44db8:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   44dbb:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
   44dc0:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
   44dc7:	e9 6f ff ff ff       	jmp    44d3b <printer::vprintf(int, char const*, __va_list_tag*)+0x3c7>
            num = (uintptr_t) va_arg(val, void*);
   44dcc:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44dd0:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   44dd4:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44dd8:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44ddc:	eb d7                	jmp    44db5 <printer::vprintf(int, char const*, __va_list_tag*)+0x441>
        switch (*format) {
   44dde:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44de2:	eb 04                	jmp    44de8 <printer::vprintf(int, char const*, __va_list_tag*)+0x474>
   44de4:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
   44de8:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44dec:	8b 07                	mov    (%rdi),%eax
   44dee:	83 f8 2f             	cmp    $0x2f,%eax
   44df1:	0f 87 70 01 00 00    	ja     44f67 <printer::vprintf(int, char const*, __va_list_tag*)+0x5f3>
   44df7:	89 c2                	mov    %eax,%edx
   44df9:	48 03 57 10          	add    0x10(%rdi),%rdx
   44dfd:	83 c0 08             	add    $0x8,%eax
   44e00:	89 07                	mov    %eax,(%rdi)
   44e02:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
   44e05:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
   44e0b:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   44e0e:	83 e0 40             	and    $0x40,%eax
   44e11:	89 45 98             	mov    %eax,-0x68(%rbp)
        const char* prefix = "";
   44e14:	41 bc 09 58 04 00    	mov    $0x45809,%r12d
        if (flags & FLAG_NUMERIC) {
   44e1a:	0f 85 f8 03 00 00    	jne    45218 <printer::vprintf(int, char const*, __va_list_tag*)+0x8a4>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   44e20:	8b 7d a0             	mov    -0x60(%rbp),%edi
   44e23:	89 f8                	mov    %edi,%eax
   44e25:	f7 d0                	not    %eax
   44e27:	c1 e8 1f             	shr    $0x1f,%eax
   44e2a:	89 45 8c             	mov    %eax,-0x74(%rbp)
   44e2d:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
   44e31:	0f 85 63 03 00 00    	jne    4519a <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
   44e37:	84 c0                	test   %al,%al
   44e39:	0f 84 5b 03 00 00    	je     4519a <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
            datalen = strnlen(data, precision);
   44e3f:	48 63 f7             	movslq %edi,%rsi
   44e42:	48 89 df             	mov    %rbx,%rdi
   44e45:	e8 34 fa ff ff       	call   4487e <strnlen>
   44e4a:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
   44e4d:	8b 45 a4             	mov    -0x5c(%rbp),%eax
   44e50:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
   44e53:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
   44e5a:	83 f8 42             	cmp    $0x42,%eax
   44e5d:	0f 84 6f 03 00 00    	je     451d2 <printer::vprintf(int, char const*, __va_list_tag*)+0x85e>
        width -= datalen + zeros + strlen(prefix);
   44e63:	4c 89 e7             	mov    %r12,%rdi
   44e66:	e8 f4 f9 ff ff       	call   4485f <strlen>
   44e6b:	8b 7d a0             	mov    -0x60(%rbp),%edi
   44e6e:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
   44e71:	01 f9                	add    %edi,%ecx
   44e73:	44 89 f2             	mov    %r14d,%edx
   44e76:	29 ca                	sub    %ecx,%edx
   44e78:	29 c2                	sub    %eax,%edx
   44e7a:	41 89 d6             	mov    %edx,%r14d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   44e7d:	f6 45 a4 04          	testb  $0x4,-0x5c(%rbp)
   44e81:	75 32                	jne    44eb5 <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
   44e83:	85 d2                	test   %edx,%edx
   44e85:	7e 2e                	jle    44eb5 <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
        width -= datalen + zeros + strlen(prefix);
   44e87:	89 55 a4             	mov    %edx,-0x5c(%rbp)
            putc(' ', color);
   44e8a:	49 8b 07             	mov    (%r15),%rax
   44e8d:	44 89 ea             	mov    %r13d,%edx
   44e90:	be 20 00 00 00       	mov    $0x20,%esi
   44e95:	4c 89 ff             	mov    %r15,%rdi
   44e98:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   44e9a:	41 83 ee 01          	sub    $0x1,%r14d
   44e9e:	45 85 f6             	test   %r14d,%r14d
   44ea1:	7f e7                	jg     44e8a <printer::vprintf(int, char const*, __va_list_tag*)+0x516>
   44ea3:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   44ea6:	85 d2                	test   %edx,%edx
   44ea8:	b8 01 00 00 00       	mov    $0x1,%eax
   44ead:	0f 4f c2             	cmovg  %edx,%eax
   44eb0:	29 c2                	sub    %eax,%edx
   44eb2:	41 89 d6             	mov    %edx,%r14d
        for (; *prefix; ++prefix) {
   44eb5:	41 0f b6 04 24       	movzbl (%r12),%eax
   44eba:	84 c0                	test   %al,%al
   44ebc:	74 1b                	je     44ed9 <printer::vprintf(int, char const*, __va_list_tag*)+0x565>
            putc(*prefix, color);
   44ebe:	0f b6 f0             	movzbl %al,%esi
   44ec1:	49 8b 07             	mov    (%r15),%rax
   44ec4:	44 89 ea             	mov    %r13d,%edx
   44ec7:	4c 89 ff             	mov    %r15,%rdi
   44eca:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
   44ecc:	49 83 c4 01          	add    $0x1,%r12
   44ed0:	41 0f b6 04 24       	movzbl (%r12),%eax
   44ed5:	84 c0                	test   %al,%al
   44ed7:	75 e5                	jne    44ebe <printer::vprintf(int, char const*, __va_list_tag*)+0x54a>
        for (; zeros > 0; --zeros) {
   44ed9:	44 8b 65 a0          	mov    -0x60(%rbp),%r12d
   44edd:	45 85 e4             	test   %r12d,%r12d
   44ee0:	7e 16                	jle    44ef8 <printer::vprintf(int, char const*, __va_list_tag*)+0x584>
            putc('0', color);
   44ee2:	49 8b 07             	mov    (%r15),%rax
   44ee5:	44 89 ea             	mov    %r13d,%edx
   44ee8:	be 30 00 00 00       	mov    $0x30,%esi
   44eed:	4c 89 ff             	mov    %r15,%rdi
   44ef0:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
   44ef2:	41 83 ec 01          	sub    $0x1,%r12d
   44ef6:	75 ea                	jne    44ee2 <printer::vprintf(int, char const*, __va_list_tag*)+0x56e>
        for (; datalen > 0; ++data, --datalen) {
   44ef8:	8b 45 9c             	mov    -0x64(%rbp),%eax
   44efb:	85 c0                	test   %eax,%eax
   44efd:	7e 1d                	jle    44f1c <printer::vprintf(int, char const*, __va_list_tag*)+0x5a8>
   44eff:	41 89 c4             	mov    %eax,%r12d
   44f02:	49 01 dc             	add    %rbx,%r12
            putc(*data, color);
   44f05:	0f b6 33             	movzbl (%rbx),%esi
   44f08:	49 8b 07             	mov    (%r15),%rax
   44f0b:	44 89 ea             	mov    %r13d,%edx
   44f0e:	4c 89 ff             	mov    %r15,%rdi
   44f11:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
   44f13:	48 83 c3 01          	add    $0x1,%rbx
   44f17:	49 39 dc             	cmp    %rbx,%r12
   44f1a:	75 e9                	jne    44f05 <printer::vprintf(int, char const*, __va_list_tag*)+0x591>
        for (; width > 0; --width) {
   44f1c:	45 85 f6             	test   %r14d,%r14d
   44f1f:	7e 16                	jle    44f37 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            putc(' ', color);
   44f21:	49 8b 07             	mov    (%r15),%rax
   44f24:	44 89 ea             	mov    %r13d,%edx
   44f27:	be 20 00 00 00       	mov    $0x20,%esi
   44f2c:	4c 89 ff             	mov    %r15,%rdi
   44f2f:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
   44f31:	41 83 ee 01          	sub    $0x1,%r14d
   44f35:	75 ea                	jne    44f21 <printer::vprintf(int, char const*, __va_list_tag*)+0x5ad>
    for (; *format; ++format) {
   44f37:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   44f3b:	4c 8d 60 01          	lea    0x1(%rax),%r12
   44f3f:	0f b6 40 01          	movzbl 0x1(%rax),%eax
   44f43:	84 c0                	test   %al,%al
   44f45:	0f 84 56 fa ff ff    	je     449a1 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
   44f4b:	3c 25                	cmp    $0x25,%al
   44f4d:	0f 84 5d fa ff ff    	je     449b0 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
   44f53:	0f b6 f0             	movzbl %al,%esi
   44f56:	49 8b 07             	mov    (%r15),%rax
   44f59:	44 89 ea             	mov    %r13d,%edx
   44f5c:	4c 89 ff             	mov    %r15,%rdi
   44f5f:	ff 10                	call   *(%rax)
            continue;
   44f61:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
   44f65:	eb d0                	jmp    44f37 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            data = va_arg(val, char*);
   44f67:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44f6b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   44f6f:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44f73:	48 89 41 08          	mov    %rax,0x8(%rcx)
   44f77:	e9 86 fe ff ff       	jmp    44e02 <printer::vprintf(int, char const*, __va_list_tag*)+0x48e>
        switch (*format) {
   44f7c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44f80:	eb 04                	jmp    44f86 <printer::vprintf(int, char const*, __va_list_tag*)+0x612>
   44f82:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color = va_arg(val, int);
   44f86:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
   44f8a:	8b 01                	mov    (%rcx),%eax
   44f8c:	83 f8 2f             	cmp    $0x2f,%eax
   44f8f:	77 10                	ja     44fa1 <printer::vprintf(int, char const*, __va_list_tag*)+0x62d>
   44f91:	89 c2                	mov    %eax,%edx
   44f93:	48 03 51 10          	add    0x10(%rcx),%rdx
   44f97:	83 c0 08             	add    $0x8,%eax
   44f9a:	89 01                	mov    %eax,(%rcx)
   44f9c:	44 8b 2a             	mov    (%rdx),%r13d
            continue;
   44f9f:	eb 96                	jmp    44f37 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            color = va_arg(val, int);
   44fa1:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
   44fa5:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   44fa9:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44fad:	48 89 43 08          	mov    %rax,0x8(%rbx)
   44fb1:	eb e9                	jmp    44f9c <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
        switch (*format) {
   44fb3:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   44fb7:	eb 04                	jmp    44fbd <printer::vprintf(int, char const*, __va_list_tag*)+0x649>
   44fb9:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
   44fbd:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44fc1:	8b 07                	mov    (%rdi),%eax
   44fc3:	83 f8 2f             	cmp    $0x2f,%eax
   44fc6:	77 23                	ja     44feb <printer::vprintf(int, char const*, __va_list_tag*)+0x677>
   44fc8:	89 c2                	mov    %eax,%edx
   44fca:	48 03 57 10          	add    0x10(%rdi),%rdx
   44fce:	83 c0 08             	add    $0x8,%eax
   44fd1:	89 07                	mov    %eax,(%rdi)
   44fd3:	8b 02                	mov    (%rdx),%eax
   44fd5:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
   44fd8:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
   44fdc:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
   44fe0:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
   44fe6:	e9 20 fe ff ff       	jmp    44e0b <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            numbuf[0] = va_arg(val, int);
   44feb:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
   44fef:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   44ff3:	48 8d 42 08          	lea    0x8(%rdx),%rax
   44ff7:	48 89 47 08          	mov    %rax,0x8(%rdi)
   44ffb:	eb d6                	jmp    44fd3 <printer::vprintf(int, char const*, __va_list_tag*)+0x65f>
        switch (*format) {
   44ffd:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
   45001:	84 c0                	test   %al,%al
   45003:	0f 85 f1 01 00 00    	jne    451fa <printer::vprintf(int, char const*, __va_list_tag*)+0x886>
   45009:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
   4500d:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
   45011:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
   45016:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
   4501a:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   45020:	e9 e6 fd ff ff       	jmp    44e0b <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
   45025:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
   45029:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
   4502d:	74 73                	je     450a2 <printer::vprintf(int, char const*, __va_list_tag*)+0x72e>
        thousands_pos = pos - (base == 10 ? 3 : 4);
   4502f:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
   45032:	41 89 d9             	mov    %ebx,%r9d
   45035:	89 45 a4             	mov    %eax,-0x5c(%rbp)
   45038:	41 ba 50 68 04 00    	mov    $0x46850,%r10d
   4503e:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
   45045:	83 fb 0a             	cmp    $0xa,%ebx
   45048:	0f 94 c0             	sete   %al
   4504b:	0f b6 c0             	movzbl %al,%eax
   4504e:	48 83 e8 04          	sub    $0x4,%rax
   45052:	eb 1d                	jmp    45071 <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
    if (flags & FLAG_THOUSANDS) {
   45054:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
   45057:	41 ba 30 68 04 00    	mov    $0x46830,%r10d
        base = -base;
   4505d:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
   45063:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
   4506a:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
   45071:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
   45076:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
   4507a:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
   4507d:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
   45080:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
   45084:	eb 57                	jmp    450dd <printer::vprintf(int, char const*, __va_list_tag*)+0x769>
    if (flags & FLAG_THOUSANDS) {
   45086:	41 ba 50 68 04 00    	mov    $0x46850,%r10d
   4508c:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   45092:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
   45099:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
   450a0:	eb cf                	jmp    45071 <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
   450a2:	44 8b 4d 9c          	mov    -0x64(%rbp),%r9d
   450a6:	89 45 a4             	mov    %eax,-0x5c(%rbp)
   450a9:	41 ba 50 68 04 00    	mov    $0x46850,%r10d
   450af:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
   450b6:	bf 00 00 00 00       	mov    $0x0,%edi
   450bb:	eb b9                	jmp    45076 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
            *--pos = digits[val % base];
   450bd:	48 89 cb             	mov    %rcx,%rbx
   450c0:	ba 00 00 00 00       	mov    $0x0,%edx
   450c5:	48 f7 f6             	div    %rsi
   450c8:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
   450cd:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
   450cf:	48 83 e9 01          	sub    $0x1,%rcx
   450d3:	48 85 c0             	test   %rax,%rax
   450d6:	74 2d                	je     45105 <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
   450d8:	4c 39 c3             	cmp    %r8,%rbx
   450db:	74 28                	je     45105 <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
        if (pos == thousands_pos) {
   450dd:	48 8d 51 01          	lea    0x1(%rcx),%rdx
   450e1:	48 39 d7             	cmp    %rdx,%rdi
   450e4:	75 d7                	jne    450bd <printer::vprintf(int, char const*, __va_list_tag*)+0x749>
            *--pos = base == 10 ? ',' : '\'';
   450e6:	48 89 cb             	mov    %rcx,%rbx
   450e9:	41 83 f9 0a          	cmp    $0xa,%r9d
   450ed:	0f 94 c2             	sete   %dl
   450f0:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
   450f4:	40 0f 94 c7          	sete   %dil
   450f8:	40 0f b6 ff          	movzbl %dil,%edi
   450fc:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
   450fe:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
   45103:	eb ca                	jmp    450cf <printer::vprintf(int, char const*, __va_list_tag*)+0x75b>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   45105:	8b 7d a4             	mov    -0x5c(%rbp),%edi
   45108:	89 f8                	mov    %edi,%eax
   4510a:	f7 d0                	not    %eax
   4510c:	a8 c0                	test   $0xc0,%al
   4510e:	75 3c                	jne    4514c <printer::vprintf(int, char const*, __va_list_tag*)+0x7d8>
                prefix = "-";
   45110:	41 bc 53 59 04 00    	mov    $0x45953,%r12d
            if (flags & FLAG_NEGATIVE) {
   45116:	f7 c7 00 01 00 00    	test   $0x100,%edi
   4511c:	0f 85 fe fc ff ff    	jne    44e20 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                prefix = "+";
   45122:	41 bc 4e 59 04 00    	mov    $0x4594e,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
   45128:	40 f6 c7 10          	test   $0x10,%dil
   4512c:	0f 85 ee fc ff ff    	jne    44e20 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
        const char* prefix = "";
   45132:	40 f6 c7 08          	test   $0x8,%dil
   45136:	ba 56 58 04 00       	mov    $0x45856,%edx
   4513b:	b8 09 58 04 00       	mov    $0x45809,%eax
   45140:	48 0f 45 c2          	cmovne %rdx,%rax
   45144:	49 89 c4             	mov    %rax,%r12
   45147:	e9 d4 fc ff ff       	jmp    44e20 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
   4514c:	41 bc 09 58 04 00    	mov    $0x45809,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   45152:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
   45155:	89 c8                	mov    %ecx,%eax
   45157:	f7 d0                	not    %eax
   45159:	a8 41                	test   $0x41,%al
   4515b:	0f 85 bf fc ff ff    	jne    44e20 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (base == 16 || base == -16)
   45161:	8b 45 9c             	mov    -0x64(%rbp),%eax
   45164:	83 c0 10             	add    $0x10,%eax
   45167:	a9 df ff ff ff       	test   $0xffffffdf,%eax
   4516c:	0f 85 ae fc ff ff    	jne    44e20 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (num || (flags & FLAG_ALT2))) {
   45172:	4d 85 db             	test   %r11,%r11
   45175:	75 09                	jne    45180 <printer::vprintf(int, char const*, __va_list_tag*)+0x80c>
   45177:	f6 c5 02             	test   $0x2,%ch
   4517a:	0f 84 a0 fc ff ff    	je     44e20 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            prefix = (base == -16 ? "0x" : "0X");
   45180:	83 7d 9c f0          	cmpl   $0xfffffff0,-0x64(%rbp)
   45184:	ba 50 59 04 00       	mov    $0x45950,%edx
   45189:	b8 55 59 04 00       	mov    $0x45955,%eax
   4518e:	48 0f 45 c2          	cmovne %rdx,%rax
   45192:	49 89 c4             	mov    %rax,%r12
   45195:	e9 86 fc ff ff       	jmp    44e20 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            datalen = strlen(data);
   4519a:	48 89 df             	mov    %rbx,%rdi
   4519d:	e8 bd f6 ff ff       	call   4485f <strlen>
   451a2:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
   451a5:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
   451a9:	0f 84 9e fc ff ff    	je     44e4d <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
   451af:	80 7d 8c 00          	cmpb   $0x0,-0x74(%rbp)
   451b3:	0f 84 94 fc ff ff    	je     44e4d <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
            zeros = precision > datalen ? precision - datalen : 0;
   451b9:	8b 7d a0             	mov    -0x60(%rbp),%edi
   451bc:	89 fa                	mov    %edi,%edx
   451be:	29 c2                	sub    %eax,%edx
   451c0:	39 c7                	cmp    %eax,%edi
   451c2:	b8 00 00 00 00       	mov    $0x0,%eax
   451c7:	0f 4f c2             	cmovg  %edx,%eax
   451ca:	89 45 a0             	mov    %eax,-0x60(%rbp)
   451cd:	e9 91 fc ff ff       	jmp    44e63 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
                   && datalen + (int) strlen(prefix) < width) {
   451d2:	4c 89 e7             	mov    %r12,%rdi
   451d5:	e8 85 f6 ff ff       	call   4485f <strlen>
   451da:	8b 7d 9c             	mov    -0x64(%rbp),%edi
   451dd:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
   451e0:	44 89 f1             	mov    %r14d,%ecx
   451e3:	29 f9                	sub    %edi,%ecx
   451e5:	29 c1                	sub    %eax,%ecx
   451e7:	44 39 f2             	cmp    %r14d,%edx
   451ea:	b8 00 00 00 00       	mov    $0x0,%eax
   451ef:	0f 4c c1             	cmovl  %ecx,%eax
   451f2:	89 45 a0             	mov    %eax,-0x60(%rbp)
   451f5:	e9 69 fc ff ff       	jmp    44e63 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
   451fa:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
   451fe:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
   45201:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
   45205:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
   45209:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
   4520d:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   45213:	e9 f3 fb ff ff       	jmp    44e0b <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
   45218:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
   4521c:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
   45220:	0f 85 60 fe ff ff    	jne    45086 <printer::vprintf(int, char const*, __va_list_tag*)+0x712>
   45226:	41 ba 50 68 04 00    	mov    $0x46850,%r10d
   4522c:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   45232:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = nullptr;
   45239:	bf 00 00 00 00       	mov    $0x0,%edi
   4523e:	e9 33 fe ff ff       	jmp    45076 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>

0000000000045243 <console_clear()>:


// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear() {
   45243:	f3 0f 1e fa          	endbr64
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   45247:	b8 00 00 00 00       	mov    $0x0,%eax
        console[i] = ' ' | 0x0700;
   4524c:	48 63 d0             	movslq %eax,%rdx
   4524f:	66 c7 84 12 00 80 0b 	movw   $0x720,0xb8000(%rdx,%rdx,1)
   45256:	00 20 07 
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   45259:	83 c0 01             	add    $0x1,%eax
   4525c:	3d d0 07 00 00       	cmp    $0x7d0,%eax
   45261:	75 e9                	jne    4524c <console_clear()+0x9>
    }
    cursorpos = 0;
   45263:	c7 05 8f 3d 07 00 00 	movl   $0x0,0x73d8f(%rip)        # b8ffc <cursorpos>
   4526a:	00 00 00 
}
   4526d:	c3                   	ret

000000000004526e <console_printer::console_printer(int, bool)>:
    void scroll();
    void move_cursor();
};

__noinline
console_printer::console_printer(int cpos, bool scroll)
   4526e:	f3 0f 1e fa          	endbr64
    : cell_(console), scroll_(scroll) {
   45272:	48 c7 07 78 68 04 00 	movq   $0x46878,(%rdi)
   45279:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
   45280:	00 
   45281:	88 57 10             	mov    %dl,0x10(%rdi)
    if (cpos < 0) {
   45284:	85 f6                	test   %esi,%esi
   45286:	78 18                	js     452a0 <console_printer::console_printer(int, bool)+0x32>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
   45288:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
   4528e:	7f 0f                	jg     4529f <console_printer::console_printer(int, bool)+0x31>
        cell_ += cpos;
   45290:	48 63 f6             	movslq %esi,%rsi
   45293:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
   4529a:	00 
   4529b:	48 89 47 08          	mov    %rax,0x8(%rdi)
    }
}
   4529f:	c3                   	ret
        cell_ += cursorpos;
   452a0:	8b 05 56 3d 07 00    	mov    0x73d56(%rip),%eax        # b8ffc <cursorpos>
   452a6:	48 98                	cltq
   452a8:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
   452af:	00 
   452b0:	48 89 47 08          	mov    %rax,0x8(%rdi)
   452b4:	c3                   	ret
   452b5:	90                   	nop

00000000000452b6 <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
   452b6:	f3 0f 1e fa          	endbr64
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
   452ba:	48 81 7f 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rdi)
   452c1:	00 
   452c2:	72 56                	jb     4531a <console_printer::scroll()+0x64>
    if (scroll_) {
   452c4:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   452c9:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
   452cd:	74 46                	je     45315 <console_printer::scroll()+0x5f>
        int i = 0;
   452cf:	b8 00 00 00 00       	mov    $0x0,%eax
        while (i != (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS) {
            console[i] = console[i + CONSOLE_COLUMNS];
   452d4:	8d 50 50             	lea    0x50(%rax),%edx
   452d7:	b9 00 80 0b 00       	mov    $0xb8000,%ecx
   452dc:	48 63 d2             	movslq %edx,%rdx
   452df:	0f b7 34 51          	movzwl (%rcx,%rdx,2),%esi
   452e3:	48 63 d0             	movslq %eax,%rdx
   452e6:	66 89 34 51          	mov    %si,(%rcx,%rdx,2)
            ++i;
   452ea:	83 c0 01             	add    $0x1,%eax
        while (i != (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS) {
   452ed:	3d 80 07 00 00       	cmp    $0x780,%eax
   452f2:	75 e0                	jne    452d4 <console_printer::scroll()+0x1e>
        }
        while (i != CONSOLE_ROWS * CONSOLE_COLUMNS) {
            console[i] = 0;
   452f4:	48 63 d0             	movslq %eax,%rdx
   452f7:	66 c7 84 12 00 80 0b 	movw   $0x0,0xb8000(%rdx,%rdx,1)
   452fe:	00 00 00 
            ++i;
   45301:	83 c0 01             	add    $0x1,%eax
        while (i != CONSOLE_ROWS * CONSOLE_COLUMNS) {
   45304:	3d d0 07 00 00       	cmp    $0x7d0,%eax
   45309:	75 e9                	jne    452f4 <console_printer::scroll()+0x3e>
        }
        cell_ -= CONSOLE_COLUMNS;
   4530b:	48 8b 47 08          	mov    0x8(%rdi),%rax
   4530f:	48 2d a0 00 00 00    	sub    $0xa0,%rax
   45315:	48 89 47 08          	mov    %rax,0x8(%rdi)
   45319:	c3                   	ret
void console_printer::scroll() {
   4531a:	55                   	push   %rbp
   4531b:	48 89 e5             	mov    %rsp,%rbp
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
   4531e:	b9 00 00 00 00       	mov    $0x0,%ecx
   45323:	ba 10 5f 04 00       	mov    $0x45f10,%edx
   45328:	be 80 02 00 00       	mov    $0x280,%esi
   4532d:	bf 47 59 04 00       	mov    $0x45947,%edi
   45332:	e8 ed da ff ff       	call   42e24 <assert_fail(char const*, int, char const*, char const*)>
   45337:	90                   	nop

0000000000045338 <console_printer::putc(unsigned char, int)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

inline void console_printer::putc(unsigned char c, int color) {
   45338:	f3 0f 1e fa          	endbr64
   4533c:	55                   	push   %rbp
   4533d:	48 89 e5             	mov    %rsp,%rbp
   45340:	41 55                	push   %r13
   45342:	41 54                	push   %r12
   45344:	53                   	push   %rbx
   45345:	48 83 ec 08          	sub    $0x8,%rsp
   45349:	48 89 fb             	mov    %rdi,%rbx
   4534c:	41 89 f5             	mov    %esi,%r13d
   4534f:	41 89 d4             	mov    %edx,%r12d
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   45352:	48 8b 47 08          	mov    0x8(%rdi),%rax
   45356:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
   4535c:	72 14                	jb     45372 <console_printer::putc(unsigned char, int)+0x3a>
        scroll();
   4535e:	48 89 df             	mov    %rbx,%rdi
   45361:	e8 50 ff ff ff       	call   452b6 <console_printer::scroll()>
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
   45366:	48 8b 43 08          	mov    0x8(%rbx),%rax
   4536a:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
   45370:	73 ec                	jae    4535e <console_printer::putc(unsigned char, int)+0x26>
    }
    if (c == '\n') {
   45372:	41 80 fd 0a          	cmp    $0xa,%r13b
   45376:	74 1e                	je     45396 <console_printer::putc(unsigned char, int)+0x5e>
        while (pos != 80) {
            *cell_++ = ' ' | color;
            ++pos;
        }
    } else {
        *cell_++ = c | color;
   45378:	45 0f b6 ed          	movzbl %r13b,%r13d
   4537c:	45 09 e5             	or     %r12d,%r13d
   4537f:	48 8d 50 02          	lea    0x2(%rax),%rdx
   45383:	48 89 53 08          	mov    %rdx,0x8(%rbx)
   45387:	66 44 89 28          	mov    %r13w,(%rax)
    }
}
   4538b:	48 83 c4 08          	add    $0x8,%rsp
   4538f:	5b                   	pop    %rbx
   45390:	41 5c                	pop    %r12
   45392:	41 5d                	pop    %r13
   45394:	5d                   	pop    %rbp
   45395:	c3                   	ret
        int pos = (cell_ - console) % 80;
   45396:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   4539c:	48 89 c1             	mov    %rax,%rcx
   4539f:	48 89 c6             	mov    %rax,%rsi
   453a2:	48 d1 fe             	sar    $1,%rsi
   453a5:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   453ac:	66 66 66 
   453af:	48 89 f0             	mov    %rsi,%rax
   453b2:	48 f7 ea             	imul   %rdx
   453b5:	48 c1 fa 05          	sar    $0x5,%rdx
   453b9:	48 89 c8             	mov    %rcx,%rax
   453bc:	48 c1 f8 3f          	sar    $0x3f,%rax
   453c0:	48 29 c2             	sub    %rax,%rdx
   453c3:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
   453c7:	48 c1 e2 04          	shl    $0x4,%rdx
   453cb:	89 f0                	mov    %esi,%eax
   453cd:	29 d0                	sub    %edx,%eax
            *cell_++ = ' ' | color;
   453cf:	41 83 cc 20          	or     $0x20,%r12d
   453d3:	48 8b 53 08          	mov    0x8(%rbx),%rdx
   453d7:	48 8d 4a 02          	lea    0x2(%rdx),%rcx
   453db:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
   453df:	66 44 89 22          	mov    %r12w,(%rdx)
            ++pos;
   453e3:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
   453e6:	83 f8 50             	cmp    $0x50,%eax
   453e9:	75 e8                	jne    453d3 <console_printer::putc(unsigned char, int)+0x9b>
   453eb:	eb 9e                	jmp    4538b <console_printer::putc(unsigned char, int)+0x53>
   453ed:	90                   	nop

00000000000453ee <console_printer::move_cursor()>:
void console_printer::move_cursor() {
   453ee:	f3 0f 1e fa          	endbr64
   453f2:	55                   	push   %rbp
   453f3:	48 89 e5             	mov    %rsp,%rbp
    cursorpos = cell_ - console;
   453f6:	48 8b 47 08          	mov    0x8(%rdi),%rax
   453fa:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   45400:	48 d1 f8             	sar    $1,%rax
   45403:	89 05 f3 3b 07 00    	mov    %eax,0x73bf3(%rip)        # b8ffc <cursorpos>
    console_show_cursor(cursorpos);
   45409:	8b 3d ed 3b 07 00    	mov    0x73bed(%rip),%edi        # b8ffc <cursorpos>
   4540f:	e8 28 d3 ff ff       	call   4273c <console_show_cursor(int)>
}
   45414:	5d                   	pop    %rbp
   45415:	c3                   	ret

0000000000045416 <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
   45416:	f3 0f 1e fa          	endbr64
   4541a:	55                   	push   %rbp
   4541b:	48 89 e5             	mov    %rsp,%rbp
   4541e:	41 56                	push   %r14
   45420:	41 55                	push   %r13
   45422:	41 54                	push   %r12
   45424:	53                   	push   %rbx
   45425:	48 83 ec 20          	sub    $0x20,%rsp
   45429:	89 fb                	mov    %edi,%ebx
   4542b:	41 89 f4             	mov    %esi,%r12d
   4542e:	49 89 d5             	mov    %rdx,%r13
   45431:	49 89 ce             	mov    %rcx,%r14
    console_printer cp(cpos, cpos < 0);
   45434:	89 fa                	mov    %edi,%edx
   45436:	c1 ea 1f             	shr    $0x1f,%edx
   45439:	89 fe                	mov    %edi,%esi
   4543b:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   4543f:	e8 2a fe ff ff       	call   4526e <console_printer::console_printer(int, bool)>
    cp.vprintf(color, format, val);
   45444:	4c 89 f1             	mov    %r14,%rcx
   45447:	4c 89 ea             	mov    %r13,%rdx
   4544a:	44 89 e6             	mov    %r12d,%esi
   4544d:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   45451:	e8 1e f5 ff ff       	call   44974 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (cpos < 0) {
   45456:	85 db                	test   %ebx,%ebx
   45458:	78 1a                	js     45474 <console_vprintf(int, int, char const*, __va_list_tag*)+0x5e>
        cp.move_cursor();
    }
    return cp.cell_ - console;
   4545a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   4545e:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   45464:	48 d1 f8             	sar    $1,%rax
}
   45467:	48 83 c4 20          	add    $0x20,%rsp
   4546b:	5b                   	pop    %rbx
   4546c:	41 5c                	pop    %r12
   4546e:	41 5d                	pop    %r13
   45470:	41 5e                	pop    %r14
   45472:	5d                   	pop    %rbp
   45473:	c3                   	ret
        cp.move_cursor();
   45474:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   45478:	e8 71 ff ff ff       	call   453ee <console_printer::move_cursor()>
   4547d:	eb db                	jmp    4545a <console_vprintf(int, int, char const*, __va_list_tag*)+0x44>

000000000004547f <console_printf(int, int, char const*, ...)>:

__noinline
int console_printf(int cpos, int color, const char* format, ...) {
   4547f:	f3 0f 1e fa          	endbr64
   45483:	55                   	push   %rbp
   45484:	48 89 e5             	mov    %rsp,%rbp
   45487:	48 83 ec 50          	sub    $0x50,%rsp
   4548b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4548f:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   45493:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   45497:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   4549e:	48 8d 45 10          	lea    0x10(%rbp),%rax
   454a2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   454a6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   454aa:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   454ae:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   454b2:	e8 5f ff ff ff       	call   45416 <console_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
    return cpos;
}
   454b7:	c9                   	leave
   454b8:	c3                   	ret

00000000000454b9 <error_printf(int, int, char const*, ...)>:


// k-hardware.cc/u-lib.cc supply error_vprintf

__noinline
int error_printf(int cpos, int color, const char* format, ...) {
   454b9:	f3 0f 1e fa          	endbr64
   454bd:	55                   	push   %rbp
   454be:	48 89 e5             	mov    %rsp,%rbp
   454c1:	48 83 ec 50          	sub    $0x50,%rsp
   454c5:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   454c9:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   454cd:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   454d1:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   454d8:	48 8d 45 10          	lea    0x10(%rbp),%rax
   454dc:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   454e0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   454e4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = error_vprintf(cpos, color, format, val);
   454e8:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   454ec:	e8 f5 d7 ff ff       	call   42ce6 <error_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
    return cpos;
}
   454f1:	c9                   	leave
   454f2:	c3                   	ret

00000000000454f3 <error_printf(char const*, ...)>:
    error_vprintf(-1, color, format, val);
    va_end(val);
}

__noinline
void error_printf(const char* format, ...) {
   454f3:	f3 0f 1e fa          	endbr64
   454f7:	55                   	push   %rbp
   454f8:	48 89 e5             	mov    %rsp,%rbp
   454fb:	48 83 ec 50          	sub    $0x50,%rsp
   454ff:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   45503:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   45507:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   4550b:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   4550f:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   45513:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   4551a:	48 8d 45 10          	lea    0x10(%rbp),%rax
   4551e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   45522:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   45526:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    error_vprintf(-1, COLOR_ERROR, format, val);
   4552a:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   4552e:	48 89 fa             	mov    %rdi,%rdx
   45531:	be 00 c0 00 00       	mov    $0xc000,%esi
   45536:	bf ff ff ff ff       	mov    $0xffffffff,%edi
   4553b:	e8 a6 d7 ff ff       	call   42ce6 <error_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
}
   45540:	c9                   	leave
   45541:	c3                   	ret

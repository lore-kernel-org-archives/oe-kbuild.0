Content-Type: multipart/mixed; boundary="===============4545075568142354542=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [nbd168-wireless:mt76 75/89] drivers/net/wireless/mediatek/mt76/mt7603/main.c:717:9: warning: Identical condition 'ret', second condition is always false
Date: Sat, 05 Dec 2020 05:27:53 +0800
Message-ID: <202012050537.c9BkkwHh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4545075568142354542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://github.com/nbd168/wireless mt76
head:   01ef374d9117f199ba8abc8a284aa5929a955f6d
commit: 91990519298e231bf102f7242d5f483bef5e514a [75/89] mt76: move tx hw d=
ata queues in mt76_phy
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"cppcheck warnings: (new ones prefixed by >>)"
>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:106:52: warning: Same va=
lue in both branches of ternary operator. [duplicateValueTernary]
    txd_len =3D cmd & MCU_UNI_PREFIX ? sizeof(*uni_txd) : sizeof(*mcu_txd);
                                                      ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wireless/mediatek/mt76/mt7603/mcu.c:307:4: warning: Unused v=
ariable: __packed [unusedVariable]
    } __packed;
      ^
--
>> drivers/net/wireless/mediatek/mt76/mt7603/main.c:717:9: warning: Identic=
al condition 'ret', second condition is always false [identicalConditionAft=
erEarlyExit]
    return ret;
           ^
   drivers/net/wireless/mediatek/mt76/mt7603/main.c:709:6: note: first cond=
ition
    if (ret)
        ^
   drivers/net/wireless/mediatek/mt76/mt7603/main.c:717:9: note: second con=
dition
    return ret;
           ^
--
>> drivers/net/wireless/mediatek/mt76/mt7603/mac.c:448:41: warning: Array '=
dev->mphy.q_tx[3]' accessed at index 3, which is out of bounds. [arrayIndex=
OutOfBounds]
      struct mt76_queue *q =3D dev->mphy.q_tx[i];
                                           ^
   drivers/net/wireless/mediatek/mt76/mt7603/mac.c:1518:21: warning: Array =
'dev->mphy.q_tx[3]' accessed at index 3, which is out of bounds. [arrayInde=
xOutOfBounds]
     q =3D dev->mphy.q_tx[i];
                       ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:3026:36: warning: Boolea=
n result is used in bitwise operation. Clarify expression with parentheses.=
 [clarifyCondition]
    req->seq_num =3D mvif->scan_seq_num | ext_phy << 7;
                                      ^
   drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:3137:36: warning: Boolea=
n result is used in bitwise operation. Clarify expression with parentheses.=
 [clarifyCondition]
    req->seq_num =3D mvif->scan_seq_num | ext_phy << 7;
                                      ^
>> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:2964:4: warning: Unused =
variable: __packed [unusedVariable]
    } __packed;
      ^
>> drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c:349:21: warning: Array=
 'dev->mphy.q_tx[3]' accessed at index 3, which is out of bounds. [arrayInd=
exOutOfBounds]
     q =3D dev->mphy.q_tx[i];
                       ^

vim +/ret +717 drivers/net/wireless/mediatek/mt76/mt7603/main.c

c8846e1015022d2 Felix Fietkau 2018-11-06  703  =

c8846e1015022d2 Felix Fietkau 2018-11-06  704  static int __init mt7603_ini=
t(void)
c8846e1015022d2 Felix Fietkau 2018-11-06  705  {
c8846e1015022d2 Felix Fietkau 2018-11-06  706  	int ret;
c8846e1015022d2 Felix Fietkau 2018-11-06  707  =

c8846e1015022d2 Felix Fietkau 2018-11-06  708  	ret =3D platform_driver_reg=
ister(&mt76_wmac_driver);
c8846e1015022d2 Felix Fietkau 2018-11-06  709  	if (ret)
c8846e1015022d2 Felix Fietkau 2018-11-06  710  		return ret;
c8846e1015022d2 Felix Fietkau 2018-11-06  711  =

c8846e1015022d2 Felix Fietkau 2018-11-06  712  #ifdef CONFIG_PCI
c8846e1015022d2 Felix Fietkau 2018-11-06  713  	ret =3D pci_register_driver=
(&mt7603_pci_driver);
c8846e1015022d2 Felix Fietkau 2018-11-06  714  	if (ret)
c8846e1015022d2 Felix Fietkau 2018-11-06  715  		platform_driver_unregister=
(&mt76_wmac_driver);
c8846e1015022d2 Felix Fietkau 2018-11-06  716  #endif
c8846e1015022d2 Felix Fietkau 2018-11-06 @717  	return ret;
c8846e1015022d2 Felix Fietkau 2018-11-06  718  }
c8846e1015022d2 Felix Fietkau 2018-11-06  719  =


:::::: The code at line 717 was first introduced by commit
:::::: c8846e1015022d2531ac4c895783e400b3e5babe mt76: add driver for MT7603=
E and MT7628/7688

:::::: TO: Felix Fietkau <nbd@nbd.name>
:::::: CC: Felix Fietkau <nbd@nbd.name>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4545075568142354542==--


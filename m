Content-Type: multipart/mixed; boundary="===============3730131920163516036=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/broadcom/genet/bcmgenet.c:4196:7: warning: Variable 'reg' is reassigned a value before the old one has been used.
Date: Sat, 05 Sep 2020 10:03:49 +0800
Message-ID: <202009051044.Bqnp8XzZ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3730131920163516036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Doug Berger <opendmb@gmail.com>
CC: Florian Fainelli <f.fainelli@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c70672d8d316ebd46ea447effadfe57ab7a30a50
commit: eb236c2994b031f805be691fa9ea39cba4690166 net: bcmgenet: Move wake-u=
p event out of side band ISR
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
compiler: riscv32-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/net/ethernet/broadcom/genet/bcmgenet.c:899:9: warning: Identical=
 condition 'ret', second condition is always false [identicalConditionAfter=
EarlyExit]
    return ret;
           ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:890:6: note: first condit=
ion
    if (ret)
        ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:899:9: note: second condi=
tion
    return ret;
           ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:2765:9: warning: Identica=
l condition 'ret', second condition is always false [identicalConditionAfte=
rEarlyExit]
    return ret;
           ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:2735:6: note: first condi=
tion
    if (ret)
        ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:2765:9: note: second cond=
ition
    return ret;
           ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:4037:6: warning: Variable=
 'err' is reassigned a value before the old one has been used. [redundantAs=
signment]
    err =3D devm_request_irq(&pdev->dev, priv->wol_irq, bcmgenet_wol_isr, 0,
        ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:3990:0: note: Variable 'e=
rr' is reassigned a value before the old one has been used.
    int err =3D -EIO;
   ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:4037:6: note: Variable 'e=
rr' is reassigned a value before the old one has been used.
    err =3D devm_request_irq(&pdev->dev, priv->wol_irq, bcmgenet_wol_isr, 0,
        ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:495:15: warning: Shifting=
 signed 32-bit value by 31 bits is undefined behaviour. See condition at li=
ne 494. [shiftTooManyBitsSigned]
     reg1 &=3D ~(1 << (f_index % 32));
                 ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:494:15: note: Assuming th=
at condition 'f_index<32' is not redundant
    if  (f_index < 32) {
                 ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:495:15: note: Shift
     reg1 &=3D ~(1 << (f_index % 32));
                 ^
>> drivers/net/ethernet/broadcom/genet/bcmgenet.c:4196:7: warning: Variable=
 'reg' is reassigned a value before the old one has been used. [redundantAs=
signment]
     reg =3D bcmgenet_intrl2_0_readl(priv, INTRL2_CPU_STAT);
         ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:4195:7: note: Variable 'r=
eg' is reassigned a value before the old one has been used.
     reg =3D bcmgenet_intrl2_0_readl(priv, INTRL2_CPU_STAT);
         ^
   drivers/net/ethernet/broadcom/genet/bcmgenet.c:4196:7: note: Variable 'r=
eg' is reassigned a value before the old one has been used.
     reg =3D bcmgenet_intrl2_0_readl(priv, INTRL2_CPU_STAT);
         ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Deb236c2994b031f805be691fa9ea39cba4690166
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout eb236c2994b031f805be691fa9ea39cba4690166
vim +/reg +4196 drivers/net/ethernet/broadcom/genet/bcmgenet.c

d9f45ab9e67116 Florian Fainelli 2019-10-15  4172  =

b6e978e50444a0 Florian Fainelli 2014-07-21  4173  #ifdef CONFIG_PM_SLEEP
eb236c2994b031 Doug Berger      2020-04-30  4174  static int bcmgenet_resum=
e_noirq(struct device *d)
b6e978e50444a0 Florian Fainelli 2014-07-21  4175  {
b6e978e50444a0 Florian Fainelli 2014-07-21  4176  	struct net_device *dev =
=3D dev_get_drvdata(d);
b6e978e50444a0 Florian Fainelli 2014-07-21  4177  	struct bcmgenet_priv *pr=
iv =3D netdev_priv(dev);
b6e978e50444a0 Florian Fainelli 2014-07-21  4178  	int ret;
eb236c2994b031 Doug Berger      2020-04-30  4179  	u32 reg;
b6e978e50444a0 Florian Fainelli 2014-07-21  4180  =

b6e978e50444a0 Florian Fainelli 2014-07-21  4181  	if (!netif_running(dev))
b6e978e50444a0 Florian Fainelli 2014-07-21  4182  		return 0;
b6e978e50444a0 Florian Fainelli 2014-07-21  4183  =

b6e978e50444a0 Florian Fainelli 2014-07-21  4184  	/* Turn on the clock */
b6e978e50444a0 Florian Fainelli 2014-07-21  4185  	ret =3D clk_prepare_enab=
le(priv->clk);
b6e978e50444a0 Florian Fainelli 2014-07-21  4186  	if (ret)
b6e978e50444a0 Florian Fainelli 2014-07-21  4187  		return ret;
b6e978e50444a0 Florian Fainelli 2014-07-21  4188  =

eb236c2994b031 Doug Berger      2020-04-30  4189  	if (device_may_wakeup(d)=
 && priv->wolopts) {
eb236c2994b031 Doug Berger      2020-04-30  4190  		/* Account for Wake-on-=
LAN events and clear those events
eb236c2994b031 Doug Berger      2020-04-30  4191  		 * (Some devices need m=
ore time between enabling the clocks
eb236c2994b031 Doug Berger      2020-04-30  4192  		 *  and the interrupt r=
egister reflecting the wake event so
eb236c2994b031 Doug Berger      2020-04-30  4193  		 *  read the register t=
wice)
eb236c2994b031 Doug Berger      2020-04-30  4194  		 */
eb236c2994b031 Doug Berger      2020-04-30  4195  		reg =3D bcmgenet_intrl2=
_0_readl(priv, INTRL2_CPU_STAT);
eb236c2994b031 Doug Berger      2020-04-30 @4196  		reg =3D bcmgenet_intrl2=
_0_readl(priv, INTRL2_CPU_STAT);
eb236c2994b031 Doug Berger      2020-04-30  4197  		if (reg & UMAC_IRQ_WAKE=
_EVENT)
eb236c2994b031 Doug Berger      2020-04-30  4198  			pm_wakeup_event(&priv-=
>pdev->dev, 0);
eb236c2994b031 Doug Berger      2020-04-30  4199  	}
eb236c2994b031 Doug Berger      2020-04-30  4200  =

eb236c2994b031 Doug Berger      2020-04-30  4201  	bcmgenet_intrl2_0_writel=
(priv, UMAC_IRQ_WAKE_EVENT, INTRL2_CPU_CLEAR);
eb236c2994b031 Doug Berger      2020-04-30  4202  =

eb236c2994b031 Doug Berger      2020-04-30  4203  	return 0;
eb236c2994b031 Doug Berger      2020-04-30  4204  }
eb236c2994b031 Doug Berger      2020-04-30  4205  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3730131920163516036==--


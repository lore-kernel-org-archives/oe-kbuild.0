Content-Type: multipart/mixed; boundary="===============2056534284345230083=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jkirsher-next-queue:dev-queue 65/72] drivers/net/ethernet/intel/e1000/e1000_hw.c:4415:58: warning: Same expression in both branches of ternary operator.
Date: Thu, 10 Sep 2020 15:48:26 +0800
Message-ID: <202009101501.hqZIXOWU%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2056534284345230083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Jesse Brandeburg <jesse.brandeburg@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue=
.git dev-queue
head:   68e2960f0dff2cf6dbc4db26539990b286631bde
commit: 659db5fb0b204ae0a3188c2d960182e44f988483 [65/72] intel-ethernet: ma=
ke W=3D1 build cleanly
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3701:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(EECD, eecd);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3702:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3718:9: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    eecd =3D er32(EECD);
           ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3722:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(EECD, eecd);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3723:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3728:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(EECD, eecd);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3729:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3734:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(EECD, eecd);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3735:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3740:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(EECD, eecd);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3741:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3746:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(EECD, eecd);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3747:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3750:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(EECD, eecd);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3751:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3766:9: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    eecd =3D er32(EECD);
           ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3772:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(EECD, eecd);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3773:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3782:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(EECD, eecd);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3786:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(EECD, eecd);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3787:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3792:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(EECD, eecd);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3793:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:3800:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(EECD, eecd);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4190:11: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
      eecd =3D er32(EECD);
             ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4248:7: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     if (er32(STATUS) & E1000_STATUS_FUNC_1)
         ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4284:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4286:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4372:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    E1000_WRITE_FLUSH();
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4374:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    E1000_WRITE_FLUSH();
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4390:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4392:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4395:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
>> drivers/net/ethernet/intel/e1000/e1000_hw.c:4415:58: warning: Same expre=
ssion in both branches of ternary operator. [duplicateExpressionTernary]
     vfta_value =3D (offset =3D=3D vfta_offset) ? vfta_bit_in_reg : 0;
                                                            ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4408:24: note: 'vfta_bit_in_=
reg' is assigned value '0' here.
    u32 vfta_bit_in_reg =3D 0;
                          ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4415:58: note: Same expressi=
on in both branches of ternary operator.
     vfta_value =3D (offset =3D=3D vfta_offset) ? vfta_bit_in_reg : 0;
                                                            ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4417:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     E1000_WRITE_FLUSH();
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4435:11: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    ledctl =3D er32(LEDCTL);
             ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4525:13: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
      ledctl =3D er32(LEDCTL);
               ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4534:4: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
      ew32(LEDCTL, ledctl);
      ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4536:4: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
      ew32(LEDCTL, hw->ledctl_mode1);
      ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4570:3: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
     ew32(LEDCTL, hw->ledctl_default);
     ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4583:13: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    u32 ctrl =3D er32(CTRL);
               ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4610:4: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
      ew32(LEDCTL, hw->ledctl_mode2);
      ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4616:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    ew32(CTRL, ctrl);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4627:13: warning: Same value=
 in both branches of ternary operator. [duplicateValueTernary]
    u32 ctrl =3D er32(CTRL);
               ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4654:4: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
      ew32(LEDCTL, hw->ledctl_mode1);
      ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4660:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    ew32(CTRL, ctrl);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4671:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(CRCERRS);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4672:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(SYMERRS);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4673:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(MPC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4674:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(SCC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4675:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(ECOL);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4676:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(MCC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4677:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(LATECOL);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4678:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(COLC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4679:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(DC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4680:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(SEC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4681:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(RLEC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4682:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(XONRXC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4683:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(XONTXC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4684:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(XOFFRXC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4685:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(XOFFTXC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4686:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(FCRUC);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4688:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(PRC64);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4689:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(PRC127);
    ^
   drivers/net/ethernet/intel/e1000/e1000_hw.c:4690:2: warning: Same value =
in both branches of ternary operator. [duplicateValueTernary]
    er32(PRC255);

# https://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue.git/c=
ommit/?id=3D659db5fb0b204ae0a3188c2d960182e44f988483
git remote add jkirsher-next-queue https://git.kernel.org/pub/scm/linux/ker=
nel/git/jkirsher/next-queue.git
git fetch --no-tags jkirsher-next-queue dev-queue
git checkout 659db5fb0b204ae0a3188c2d960182e44f988483
vim +4415 drivers/net/ethernet/intel/e1000/e1000_hw.c

^1da177e4c3f41 drivers/net/e1000/e1000_hw.c                Linus Torvalds  =
 2005-04-16  4398  =

120a5d0d588c9a drivers/net/e1000/e1000_hw.c                Jesse Brandeburg=
 2009-09-25  4399  /**
120a5d0d588c9a drivers/net/e1000/e1000_hw.c                Jesse Brandeburg=
 2009-09-25  4400   * e1000_clear_vfta - Clears the VLAN filer table
120a5d0d588c9a drivers/net/e1000/e1000_hw.c                Jesse Brandeburg=
 2009-09-25  4401   * @hw: Struct containing variables accessed by shared c=
ode
120a5d0d588c9a drivers/net/e1000/e1000_hw.c                Jesse Brandeburg=
 2009-09-25  4402   */
6479884509e6cd drivers/net/e1000/e1000_hw.c                Joe Perches     =
 2008-07-11  4403  static void e1000_clear_vfta(struct e1000_hw *hw)
^1da177e4c3f41 drivers/net/e1000/e1000_hw.c                Linus Torvalds  =
 2005-04-16  4404  {
406874a7ccee92 drivers/net/e1000/e1000_hw.c                Joe Perches     =
 2008-04-03  4405  	u32 offset;
406874a7ccee92 drivers/net/e1000/e1000_hw.c                Joe Perches     =
 2008-04-03  4406  	u32 vfta_value =3D 0;
406874a7ccee92 drivers/net/e1000/e1000_hw.c                Joe Perches     =
 2008-04-03  4407  	u32 vfta_offset =3D 0;
406874a7ccee92 drivers/net/e1000/e1000_hw.c                Joe Perches     =
 2008-04-03  4408  	u32 vfta_bit_in_reg =3D 0;
^1da177e4c3f41 drivers/net/e1000/e1000_hw.c                Linus Torvalds  =
 2005-04-16  4409  =

2d7edb923a8236 drivers/net/e1000/e1000_hw.c                Malli Chilakala =
 2005-04-28  4410  	for (offset =3D 0; offset < E1000_VLAN_FILTER_TBL_SIZE;=
 offset++) {
2d7edb923a8236 drivers/net/e1000/e1000_hw.c                Malli Chilakala =
 2005-04-28  4411  		/* If the offset we want to clear is the same offset o=
f the
2d7edb923a8236 drivers/net/e1000/e1000_hw.c                Malli Chilakala =
 2005-04-28  4412  		 * manageability VLAN ID, then clear all bits except t=
hat of the
6cfbd97b3e891e drivers/net/ethernet/intel/e1000/e1000_hw.c Jeff Kirsher    =
 2013-02-09  4413  		 * manageability unit
6cfbd97b3e891e drivers/net/ethernet/intel/e1000/e1000_hw.c Jeff Kirsher    =
 2013-02-09  4414  		 */
2d7edb923a8236 drivers/net/e1000/e1000_hw.c                Malli Chilakala =
 2005-04-28 @4415  		vfta_value =3D (offset =3D=3D vfta_offset) ? vfta_bit_=
in_reg : 0;
2d7edb923a8236 drivers/net/e1000/e1000_hw.c                Malli Chilakala =
 2005-04-28  4416  		E1000_WRITE_REG_ARRAY(hw, VFTA, offset, vfta_value);
1dc329180fe22f drivers/net/e1000/e1000_hw.c                Joe Perches     =
 2008-07-11  4417  		E1000_WRITE_FLUSH();
2d7edb923a8236 drivers/net/e1000/e1000_hw.c                Malli Chilakala =
 2005-04-28  4418  	}
^1da177e4c3f41 drivers/net/e1000/e1000_hw.c                Linus Torvalds  =
 2005-04-16  4419  }
^1da177e4c3f41 drivers/net/e1000/e1000_hw.c                Linus Torvalds  =
 2005-04-16  4420  =


:::::: The code@line 4415 was first introduced by commit
:::::: 2d7edb923a823660b081bd4c660300ee19adca8d [PATCH] e1000:82573 specifi=
c code & packet split code

:::::: TO: Malli Chilakala <mallikarjuna.chilakala@intel.com>
:::::: CC: Jeff Garzik <jgarzik@pobox.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2056534284345230083==--


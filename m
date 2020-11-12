Content-Type: multipart/mixed; boundary="===============1633724972348733480=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/core/devlink.c:4415:9: warning: Identical condition 'err', second condition is always false
Date: Thu, 12 Nov 2020 18:27:52 +0800
Message-ID: <202011121845.QQblcHLR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1633724972348733480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Aya Levin <ayal@mellanox.com>
CC: Saeed Mahameed <saeedm@mellanox.com>
CC: Jiri Pirko <jiri@mellanox.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3d5e28bff7ad55aea081c1af516cc1c94a5eca7d
commit: 573ed90aa5e23b512168400ba6d65e592081944e devlink: Force enclosing a=
rray on binary fmsg data
date:   9 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 9 months ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/core/devlink.c:4415:9: warning: Identical condition 'err', second co=
ndition is always false [identicalConditionAfterEarlyExit]
    return err;
           ^
   net/core/devlink.c:4411:6: note: first condition
    if (err)
        ^
   net/core/devlink.c:4415:9: note: second condition
    return err;
           ^

vim +/err +4415 net/core/devlink.c

1db64e8733f653 Eran Ben Elisha 2019-02-07  4404  =

573ed90aa5e23b Aya Levin       2020-02-11  4405  int devlink_fmsg_binary_pa=
ir_nest_start(struct devlink_fmsg *fmsg,
573ed90aa5e23b Aya Levin       2020-02-11  4406  					const char *name)
573ed90aa5e23b Aya Levin       2020-02-11  4407  {
573ed90aa5e23b Aya Levin       2020-02-11  4408  	int err;
573ed90aa5e23b Aya Levin       2020-02-11  4409  =

573ed90aa5e23b Aya Levin       2020-02-11  4410  	err =3D devlink_fmsg_arr_=
pair_nest_start(fmsg, name);
573ed90aa5e23b Aya Levin       2020-02-11  4411  	if (err)
573ed90aa5e23b Aya Levin       2020-02-11  4412  		return err;
573ed90aa5e23b Aya Levin       2020-02-11  4413  =

573ed90aa5e23b Aya Levin       2020-02-11  4414  	fmsg->putting_binary =3D =
true;
573ed90aa5e23b Aya Levin       2020-02-11 @4415  	return err;
573ed90aa5e23b Aya Levin       2020-02-11  4416  }
573ed90aa5e23b Aya Levin       2020-02-11  4417  EXPORT_SYMBOL_GPL(devlink_=
fmsg_binary_pair_nest_start);
573ed90aa5e23b Aya Levin       2020-02-11  4418  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1633724972348733480==--


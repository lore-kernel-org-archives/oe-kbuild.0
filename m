Content-Type: multipart/mixed; boundary="===============2696472322081431554=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/core/devlink.c:4415:9: warning: Identical condition 'err', second condition is always false
Date: Sun, 11 Oct 2020 10:32:28 +0800
Message-ID: <202010111021.9TLcrqTz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2696472322081431554==
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
head:   6f2f486d57c4d562cdf4932320b66fbb878ab1c4
commit: 573ed90aa5e23b512168400ba6d65e592081944e devlink: Force enclosing a=
rray on binary fmsg data
date:   8 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 8 months ago
compiler: alpha-linux-gcc (GCC) 9.3.0

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

1db64e8733f6538 Eran Ben Elisha 2019-02-07  4404  =

573ed90aa5e23b5 Aya Levin       2020-02-11  4405  int devlink_fmsg_binary_p=
air_nest_start(struct devlink_fmsg *fmsg,
573ed90aa5e23b5 Aya Levin       2020-02-11  4406  					const char *name)
573ed90aa5e23b5 Aya Levin       2020-02-11  4407  {
573ed90aa5e23b5 Aya Levin       2020-02-11  4408  	int err;
573ed90aa5e23b5 Aya Levin       2020-02-11  4409  =

573ed90aa5e23b5 Aya Levin       2020-02-11  4410  	err =3D devlink_fmsg_arr=
_pair_nest_start(fmsg, name);
573ed90aa5e23b5 Aya Levin       2020-02-11  4411  	if (err)
573ed90aa5e23b5 Aya Levin       2020-02-11  4412  		return err;
573ed90aa5e23b5 Aya Levin       2020-02-11  4413  =

573ed90aa5e23b5 Aya Levin       2020-02-11  4414  	fmsg->putting_binary =3D=
 true;
573ed90aa5e23b5 Aya Levin       2020-02-11 @4415  	return err;
573ed90aa5e23b5 Aya Levin       2020-02-11  4416  }
573ed90aa5e23b5 Aya Levin       2020-02-11  4417  EXPORT_SYMBOL_GPL(devlink=
_fmsg_binary_pair_nest_start);
573ed90aa5e23b5 Aya Levin       2020-02-11  4418  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2696472322081431554==--


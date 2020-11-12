Content-Type: multipart/mixed; boundary="===============0825306198877091083=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: net/core/devlink.c:4415:9: warning: Identical condition 'err', second condition is always false
Date: Thu, 12 Nov 2020 14:00:11 +0300
Message-ID: <20201112110011.GX18329@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0825306198877091083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
 master
head:   3d5e28bff7ad55aea081c1af516cc1c94a5eca7d
commit: 573ed90aa5e23b512168400ba6d65e592081944e devlink: Force enclosing a=
rray on binary fmsg data
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

Just "return 0;"

573ed90aa5e23b Aya Levin       2020-02-11  4416  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============0825306198877091083==--


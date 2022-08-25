Content-Type: multipart/mixed; boundary="===============9039759475849337946=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/hisilicon/qm.c:1704:2: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Fri, 26 Aug 2022 00:08:20 +0800
Message-ID: <202208260029.p595hBcM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9039759475849337946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/c=
rypto/hisilicon/qm.c:1704:2: warning: Assignment of function parameter has =
no effect outside the function. Did you forget dereferencing it? [uselessAs=
signmentPtrArg]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kai Ye <yekai13@huawei.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Longfang Liu <liulongfang@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c40e8341e3b3bb27e3a65b06b5b454626234c4f0
commit: f1724d397c60d296c0805c95a46ae7fc7163b70c crypto: hisilicon/qm - add=
 register checking for ACC
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f1724d397c60d296c0805c95a46ae7fc7163b70c
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> drivers/crypto/hisilicon/qm.c:4563:8: warning: %x in format string (no. =
2) requires 'unsigned int *' but the argument type is 'signed int *'. [inva=
lidScanfArgType_int]
    ret =3D sscanf(tbuf_bdf, "%u:%x:%u.%u", &tmp1, &bus, &device, &function=
);
          ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/crypto/hisilicon/qm.c:1704:2: warning: Assignment of function pa=
rameter has no effect outside the function. Did you forget dereferencing it=
? [uselessAssignmentPtrArg]
    dregs =3D NULL;
    ^
>> drivers/crypto/hisilicon/qm.c:4553:8: warning: sscanf() without field wi=
dth limits can crash with huge input data. [invalidscanf]
    ret =3D sscanf(buf, "%s %s", tbuf_bdf, val_buf);
          ^
>> drivers/crypto/hisilicon/qm.c:3493:46: warning: Parameter 'pdev' can be =
declared with const [constParameter]
   static int qm_try_frozen_vfs(struct pci_dev *pdev,
                                                ^
>> drivers/crypto/hisilicon/qm.c:4229:29: warning: Uninitialized variable: =
tmp->distance [uninitvar]
      if (res->distance < tmp->distance) {
                               ^
   drivers/crypto/hisilicon/qm.c:4222:7: note: Assuming condition is false
     if (!res)
         ^
   drivers/crypto/hisilicon/qm.c:4229:29: note: Uninitialized variable: tmp=
->distance
      if (res->distance < tmp->distance) {
                               ^

vim +1704 drivers/crypto/hisilicon/qm.c

f1724d397c60d2 Kai Ye 2022-04-09  1692  =

f1724d397c60d2 Kai Ye 2022-04-09  1693  static void dfx_regs_uninit(struct =
hisi_qm *qm,
f1724d397c60d2 Kai Ye 2022-04-09  1694  		struct dfx_diff_registers *dregs,=
 int reg_len)
f1724d397c60d2 Kai Ye 2022-04-09  1695  {
f1724d397c60d2 Kai Ye 2022-04-09  1696  	int i;
f1724d397c60d2 Kai Ye 2022-04-09  1697  =

f1724d397c60d2 Kai Ye 2022-04-09  1698  	/* Setting the pointer is NULL to =
prevent double free */
f1724d397c60d2 Kai Ye 2022-04-09  1699  	for (i =3D 0; i < reg_len; i++) {
f1724d397c60d2 Kai Ye 2022-04-09  1700  		kfree(dregs[i].regs);
f1724d397c60d2 Kai Ye 2022-04-09  1701  		dregs[i].regs =3D NULL;
f1724d397c60d2 Kai Ye 2022-04-09  1702  	}
f1724d397c60d2 Kai Ye 2022-04-09  1703  	kfree(dregs);
f1724d397c60d2 Kai Ye 2022-04-09 @1704  	dregs =3D NULL;
f1724d397c60d2 Kai Ye 2022-04-09  1705  }
f1724d397c60d2 Kai Ye 2022-04-09  1706  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9039759475849337946==--


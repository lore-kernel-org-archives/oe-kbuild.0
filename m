Content-Type: multipart/mixed; boundary="===============1422966038017467440=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:herbert/cryptodev-2.6/master 36/48] drivers/crypto/hisilicon/qm.c:1704:2: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Mon, 18 Apr 2022 15:03:27 +0800
Message-ID: <202204181415.Y09i8WW0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1422966038017467440==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Kai Ye <yekai13@huawei.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Longfang Liu <liulongfang@huawei.com>

tree:   https://github.com/ammarfaizi2/linux-block herbert/cryptodev-2.6/ma=
ster
head:   b45b0a12200893732a0b0ec4a6df18521fd976ad
commit: f1724d397c60d296c0805c95a46ae7fc7163b70c [36/48] crypto: hisilicon/=
qm - add register checking for ACC
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f1724d397c60d296c0805c95a46ae7fc7163b70c
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/crypto/hisilicon/sgl.c:74:17: warning: Shifting signed 32-bit va=
lue by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    block_size =3D 1 << (PAGE_SHIFT + MAX_ORDER <=3D 32 ?
                   ^
>> drivers/crypto/hisilicon/sgl.c:74:17: warning: Signed integer overflow f=
or expression '1<<(PAGE_SHIFT+MAX_ORDER<=3D32?PAGE_SHIFT+MAX_ORDER-1:31)'. =
[integerOverflow]
    block_size =3D 1 << (PAGE_SHIFT + MAX_ORDER <=3D 32 ?
                   ^
--
>> drivers/crypto/hisilicon/qm.c:1704:2: warning: Assignment of function pa=
rameter has no effect outside the function. Did you forget dereferencing it=
? [uselessAssignmentPtrArg]
    dregs =3D NULL;
    ^
>> drivers/crypto/hisilicon/qm.c:4563:8: warning: %x in format string (no. =
2) requires 'unsigned int *' but the argument type is 'signed int *'. [inva=
lidScanfArgType_int]
    ret =3D sscanf(tbuf_bdf, "%u:%x:%u.%u", &tmp1, &bus, &device, &function=
);
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
--===============1422966038017467440==--


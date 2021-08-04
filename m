Content-Type: multipart/mixed; boundary="===============3024734553839407947=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/target/target_core_user.c:2477:8: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
Date: Wed, 04 Aug 2021 09:33:29 +0800
Message-ID: <202108040913.BVsINf7h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3024734553839407947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bodo Stroesser <bostroesser@gmail.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d5ad8ec3cfb56a017de6a784835666475b4be349
commit: f5ce815f34bc97b92f5605eced806f1d32e1d602 scsi: target: tcmu: Suppor=
t DATA_BLOCK_SIZE =3D N * PAGE_SIZE
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
compiler: microblaze-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
   drivers/target/target_core_user.c:2476:8: warning: %llu in format string=
 (no. 1) requires 'unsigned long long' but the argument type is 'unsigned l=
ong'. [invalidPrintfArgType_uint]
    bl +=3D sprintf(b + bl, "Size: %llu ", udev->dev_size);
          ^
>> drivers/target/target_core_user.c:2477:8: warning: %u in format string (=
no. 1) requires 'unsigned int' but the argument type is 'signed int'. [inva=
lidPrintfArgType_uint]
    bl +=3D sprintf(b + bl, "MaxDataAreaMB: %un", udev->data_area_mb);
          ^
   drivers/target/target_core_user.c:2571:9: warning: %u in format string (=
no. 1) requires 'unsigned int' but the argument type is 'signed int'. [inva=
lidPrintfArgType_uint]
    return snprintf(page, PAGE_SIZE, "%un", udev->data_area_mb);
           ^
   drivers/target/target_core_user.c:2643:9: warning: %llu in format string=
 (no. 1) requires 'unsigned long long' but the argument type is 'unsigned l=
ong'. [invalidPrintfArgType_uint]
    return snprintf(page, PAGE_SIZE, "%llun", udev->dev_size);
           ^

vim +2477 drivers/target/target_core_user.c

7c9e7a6fe11c8d Andy Grover    2014-10-01  2468  =

7c9e7a6fe11c8d Andy Grover    2014-10-01  2469  static ssize_t tcmu_show_co=
nfigfs_dev_params(struct se_device *dev, char *b)
7c9e7a6fe11c8d Andy Grover    2014-10-01  2470  {
7c9e7a6fe11c8d Andy Grover    2014-10-01  2471  	struct tcmu_dev *udev =3D =
TCMU_DEV(dev);
7c9e7a6fe11c8d Andy Grover    2014-10-01  2472  	ssize_t bl =3D 0;
7c9e7a6fe11c8d Andy Grover    2014-10-01  2473  =

7c9e7a6fe11c8d Andy Grover    2014-10-01  2474  	bl =3D sprintf(b + bl, "Co=
nfig: %s ",
7c9e7a6fe11c8d Andy Grover    2014-10-01  2475  		     udev->dev_config[0] =
? udev->dev_config : "NULL");
0e0d75267107e6 Mike Christie  2018-07-23  2476  	bl +=3D sprintf(b + bl, "S=
ize: %llu ", udev->dev_size);
f5ce815f34bc97 Bodo Stroesser 2021-03-24 @2477  	bl +=3D sprintf(b + bl, "M=
axDataAreaMB: %u\n", udev->data_area_mb);
7c9e7a6fe11c8d Andy Grover    2014-10-01  2478  =

7c9e7a6fe11c8d Andy Grover    2014-10-01  2479  	return bl;
7c9e7a6fe11c8d Andy Grover    2014-10-01  2480  }
7c9e7a6fe11c8d Andy Grover    2014-10-01  2481  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3024734553839407947==--


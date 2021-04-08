Content-Type: multipart/mixed; boundary="===============2360432268958201204=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [weiny2:tip-pks-v4-5.12-rc 20/23] drivers/dax/super.c:350:7: warning: Unused variable: avail [unusedVariable]
Date: Thu, 08 Apr 2021 13:53:45 +0800
Message-ID: <202104081336.lZI8WpxH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2360432268958201204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Ira Weiny <ira.weiny@intel.com>

tree:   https://github.com/weiny2/linux-kernel.git tip-pks-v4-5.12-rc
head:   b8f2dcd125fa7a88ac29aabf06ff75ee220feb12
commit: 540c4a742db589e1cfba54ce1a26615b234f3790 [20/23] dax: Stray access =
protection for dax_direct_access()
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/dax/super.c:350:7: warning: Unused variable: avail [unusedVariab=
le]
    long avail;
         ^

vim +350 drivers/dax/super.c

b0686260fecaa9 Dan Williams 2017-01-26  341  =

540c4a742db589 Ira Weiny    2020-06-04  342  /**
540c4a742db589 Ira Weiny    2020-06-04  343   * dax_release_direct_access()=
 - translate a device pgoff to an absolute pfn
540c4a742db589 Ira Weiny    2020-06-04  344   *
540c4a742db589 Ira Weiny    2020-06-04  345   * @dax_dev: a dax_device inst=
ance representing the logical memory range
540c4a742db589 Ira Weiny    2020-06-04  346   * @kaddr: virtual address ret=
urned from dax_direct_access()
540c4a742db589 Ira Weiny    2020-06-04  347   */
540c4a742db589 Ira Weiny    2020-06-04  348  void dax_release_direct_access=
(struct dax_device *dax_dev, void *kaddr)
540c4a742db589 Ira Weiny    2020-06-04  349  {
540c4a742db589 Ira Weiny    2020-06-04 @350  	long avail;
540c4a742db589 Ira Weiny    2020-06-04  351  =

540c4a742db589 Ira Weiny    2020-06-04  352  	if (!dax_dev || !dax_alive(da=
x_dev))
540c4a742db589 Ira Weiny    2020-06-04  353  		return;
540c4a742db589 Ira Weiny    2020-06-04  354  =

540c4a742db589 Ira Weiny    2020-06-04  355  	if (dax_dev->ops->release_dir=
ect_access)
540c4a742db589 Ira Weiny    2020-06-04  356  		dax_dev->ops->release_direct=
_access(kaddr);
540c4a742db589 Ira Weiny    2020-06-04  357  }
540c4a742db589 Ira Weiny    2020-06-04  358  EXPORT_SYMBOL_GPL(dax_release_=
direct_access);
540c4a742db589 Ira Weiny    2020-06-04  359  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2360432268958201204==--


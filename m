Content-Type: multipart/mixed; boundary="===============4678503380649258154=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] driver core: cleanup kstrto*() usage
Date: Sun, 22 Nov 2020 23:32:07 +0800
Message-ID: <202011222351.COpYF5Hy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4678503380649258154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20201122121018.GA48617@localhost.localdomain>
References: <20201122121018.GA48617@localhost.localdomain>
TO: Alexey Dobriyan <adobriyan@gmail.com>
TO: gregkh(a)linuxfoundation.org
TO: rafael(a)kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Alexey,

I love your patch! Perhaps something to improve:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on v5.10-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexey-Dobriyan/driver-cor=
e-cleanup-kstrto-usage/20201122-201458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.=
git 33c0c9bdf7a59051a654cd98b7d2b48ce0080967
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/base/core.c:3196:10: warning: Identical inner 'return' condition=
 is always true. [identicalInnerCondition]
     return *tmp;
            ^
   drivers/base/core.c:3195:6: note: outer condition: *tmp
    if (*tmp)
        ^
   drivers/base/core.c:3196:10: note: identical inner condition: *tmp
     return *tmp;
            ^
   drivers/base/core.c:3202:10: warning: Identical inner 'return' condition=
 is always true. [identicalInnerCondition]
     return *tmp;
            ^
   drivers/base/core.c:3201:6: note: outer condition: *tmp
    if (*tmp)
        ^
   drivers/base/core.c:3202:10: note: identical inner condition: *tmp
     return *tmp;
            ^
>> drivers/base/core.c:1725:6: warning: Unused variable: val [unusedVariabl=
e]
    int val;
        ^

vim +1725 drivers/base/core.c

ca22e56debc57b Kay Sievers     2011-12-14  1719  =

ca22e56debc57b Kay Sievers     2011-12-14  1720  ssize_t device_store_int(s=
truct device *dev,
ca22e56debc57b Kay Sievers     2011-12-14  1721  			 struct device_attribut=
e *attr,
ca22e56debc57b Kay Sievers     2011-12-14  1722  			 const char *buf, size_=
t size)
ca22e56debc57b Kay Sievers     2011-12-14  1723  {
ca22e56debc57b Kay Sievers     2011-12-14  1724  	struct dev_ext_attribute =
*ea =3D to_ext_attr(attr);
e7443ff26978ad Alexey Dobriyan 2020-11-22 @1725  	int val;
f88184bfee48d4 Kaitao cheng    2018-11-06  1726  	int ret;
f88184bfee48d4 Kaitao cheng    2018-11-06  1727  =

e7443ff26978ad Alexey Dobriyan 2020-11-22  1728  	ret =3D kstrtoint(buf, 0,=
 (int *)ea->var);
f88184bfee48d4 Kaitao cheng    2018-11-06  1729  	if (ret)
f88184bfee48d4 Kaitao cheng    2018-11-06  1730  		return ret;
ca22e56debc57b Kay Sievers     2011-12-14  1731  	/* Always return full wri=
te size even if we didn't consume all */
ca22e56debc57b Kay Sievers     2011-12-14  1732  	return size;
ca22e56debc57b Kay Sievers     2011-12-14  1733  }
ca22e56debc57b Kay Sievers     2011-12-14  1734  EXPORT_SYMBOL_GPL(device_s=
tore_int);
ca22e56debc57b Kay Sievers     2011-12-14  1735  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4678503380649258154==--


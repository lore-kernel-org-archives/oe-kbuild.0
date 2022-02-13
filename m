Content-Type: multipart/mixed; boundary="===============3564954705187911107=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hnaz-mm:master 14/304] mm/hugetlb.c:4170 hugepages_setup() warn: potential spectre issue 'default_hugepages_in_node' [w]
Date: Mon, 14 Feb 2022 02:38:36 +0800
Message-ID: <202202140231.kXy0RxiN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3564954705187911107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Liu Yuntao <liuyuntao10@huawei.com>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Mike Kravetz <mike.kravetz@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/hnaz/linux-mm master
head:   31e523f69aa14a1f4ba298c63034d8dc62c4aae7
commit: a9cab87f99a622ebdceb96c678eddfda78786005 [14/304] hugetlbfs: fix a =
truncation issue in hugepages parameter
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20214/202202140231.kXy0RxiN-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/hugetlb.c:4170 hugepages_setup() warn: potential spectre issue 'default_=
hugepages_in_node' [w]
mm/hugetlb.c:4172 hugepages_setup() warn: potential spectre issue 'parsed_h=
state->max_huge_pages_node' [w]

vim +/default_hugepages_in_node +4170 mm/hugetlb.c

a3437870160cf2 Nishanth Aravamudan 2008-07-23  4109  =

b5389086ad7be0 Zhenguo Yao         2021-11-05  4110  bool __init __weak hug=
etlb_node_alloc_supported(void)
b5389086ad7be0 Zhenguo Yao         2021-11-05  4111  {
b5389086ad7be0 Zhenguo Yao         2021-11-05  4112  	return true;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4113  }
282f4214384ee2 Mike Kravetz        2020-06-03  4114  /*
282f4214384ee2 Mike Kravetz        2020-06-03  4115   * hugepages command l=
ine processing
282f4214384ee2 Mike Kravetz        2020-06-03  4116   * hugepages normally =
follows a valid hugepagsz or default_hugepagsz
282f4214384ee2 Mike Kravetz        2020-06-03  4117   * specification.  If =
not, ignore the hugepages value.  hugepages can also
282f4214384ee2 Mike Kravetz        2020-06-03  4118   * be the first huge p=
age command line  option in which case it implicitly
282f4214384ee2 Mike Kravetz        2020-06-03  4119   * specifies the numbe=
r of huge pages for the default size.
282f4214384ee2 Mike Kravetz        2020-06-03  4120   */
282f4214384ee2 Mike Kravetz        2020-06-03  4121  static int __init huge=
pages_setup(char *s)
a3437870160cf2 Nishanth Aravamudan 2008-07-23  4122  {
a3437870160cf2 Nishanth Aravamudan 2008-07-23  4123  	unsigned long *mhp;
8faa8b077b2cdc Andi Kleen          2008-07-23  4124  	static unsigned long =
*last_mhp;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4125  	int node =3D NUMA_NO_=
NODE;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4126  	int count;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4127  	unsigned long tmp;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4128  	char *p =3D s;
a3437870160cf2 Nishanth Aravamudan 2008-07-23  4129  =

9fee021d15ddd8 Vaishali Thakkar    2016-05-19  4130  	if (!parsed_valid_hug=
epagesz) {
282f4214384ee2 Mike Kravetz        2020-06-03  4131  		pr_warn("HugeTLB: hu=
gepages=3D%s does not follow a valid hugepagesz, ignoring\n", s);
9fee021d15ddd8 Vaishali Thakkar    2016-05-19  4132  		parsed_valid_hugepag=
esz =3D true;
282f4214384ee2 Mike Kravetz        2020-06-03  4133  		return 0;
9fee021d15ddd8 Vaishali Thakkar    2016-05-19  4134  	}
282f4214384ee2 Mike Kravetz        2020-06-03  4135  =

a3437870160cf2 Nishanth Aravamudan 2008-07-23  4136  	/*
282f4214384ee2 Mike Kravetz        2020-06-03  4137  	 * !hugetlb_max_hstat=
e means we haven't parsed a hugepagesz=3D parameter
282f4214384ee2 Mike Kravetz        2020-06-03  4138  	 * yet, so this hugep=
ages=3D parameter goes to the "default hstate".
282f4214384ee2 Mike Kravetz        2020-06-03  4139  	 * Otherwise, it goes=
 with the previously parsed hugepagesz or
282f4214384ee2 Mike Kravetz        2020-06-03  4140  	 * default_hugepagesz.
a3437870160cf2 Nishanth Aravamudan 2008-07-23  4141  	 */
9fee021d15ddd8 Vaishali Thakkar    2016-05-19  4142  	else if (!hugetlb_max=
_hstate)
a3437870160cf2 Nishanth Aravamudan 2008-07-23  4143  		mhp =3D &default_hst=
ate_max_huge_pages;
a3437870160cf2 Nishanth Aravamudan 2008-07-23  4144  	else
a3437870160cf2 Nishanth Aravamudan 2008-07-23  4145  		mhp =3D &parsed_hsta=
te->max_huge_pages;
a3437870160cf2 Nishanth Aravamudan 2008-07-23  4146  =

8faa8b077b2cdc Andi Kleen          2008-07-23  4147  	if (mhp =3D=3D last_m=
hp) {
282f4214384ee2 Mike Kravetz        2020-06-03  4148  		pr_warn("HugeTLB: hu=
gepages=3D specified twice without interleaving hugepagesz=3D, ignoring hug=
epages=3D%s\n", s);
282f4214384ee2 Mike Kravetz        2020-06-03  4149  		return 0;
8faa8b077b2cdc Andi Kleen          2008-07-23  4150  	}
8faa8b077b2cdc Andi Kleen          2008-07-23  4151  =

b5389086ad7be0 Zhenguo Yao         2021-11-05  4152  	while (*p) {
b5389086ad7be0 Zhenguo Yao         2021-11-05  4153  		count =3D 0;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4154  		if (sscanf(p, "%lu%n=
", &tmp, &count) !=3D 1)
b5389086ad7be0 Zhenguo Yao         2021-11-05  4155  			goto invalid;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4156  		/* Parameter is node=
 format */
b5389086ad7be0 Zhenguo Yao         2021-11-05  4157  		if (p[count] =3D=3D =
':') {
b5389086ad7be0 Zhenguo Yao         2021-11-05  4158  			if (!hugetlb_node_a=
lloc_supported()) {
b5389086ad7be0 Zhenguo Yao         2021-11-05  4159  				pr_warn("HugeTLB: =
architecture can't support node specific alloc, ignoring!\n");
b5389086ad7be0 Zhenguo Yao         2021-11-05  4160  				return 0;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4161  			}
a9cab87f99a622 Liu Yuntao          2022-02-11  4162  			if (tmp >=3D nr_onl=
ine_nodes)
a9cab87f99a622 Liu Yuntao          2022-02-11  4163  				goto invalid;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4164  			node =3D tmp;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4165  			p +=3D count + 1;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4166  			/* Parse hugepages =
*/
b5389086ad7be0 Zhenguo Yao         2021-11-05  4167  			if (sscanf(p, "%lu%=
n", &tmp, &count) !=3D 1)
b5389086ad7be0 Zhenguo Yao         2021-11-05  4168  				goto invalid;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4169  			if (!hugetlb_max_hs=
tate)
b5389086ad7be0 Zhenguo Yao         2021-11-05 @4170  				default_hugepages_=
in_node[node] =3D tmp;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4171  			else
b5389086ad7be0 Zhenguo Yao         2021-11-05 @4172  				parsed_hstate->max=
_huge_pages_node[node] =3D tmp;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4173  			*mhp +=3D tmp;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4174  			/* Go to parse next=
 node*/
b5389086ad7be0 Zhenguo Yao         2021-11-05  4175  			if (p[count] =3D=3D=
 ',')
b5389086ad7be0 Zhenguo Yao         2021-11-05  4176  				p +=3D count + 1;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4177  			else
b5389086ad7be0 Zhenguo Yao         2021-11-05  4178  				break;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4179  		} else {
b5389086ad7be0 Zhenguo Yao         2021-11-05  4180  			if (p !=3D s)
b5389086ad7be0 Zhenguo Yao         2021-11-05  4181  				goto invalid;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4182  			*mhp =3D tmp;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4183  			break;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4184  		}
b5389086ad7be0 Zhenguo Yao         2021-11-05  4185  	}
a3437870160cf2 Nishanth Aravamudan 2008-07-23  4186  =

8faa8b077b2cdc Andi Kleen          2008-07-23  4187  	/*
8faa8b077b2cdc Andi Kleen          2008-07-23  4188  	 * Global state is al=
ways initialized later in hugetlb_init.
04adbc3f7bff40 Miaohe Lin          2021-05-04  4189  	 * But we need to all=
ocate gigantic hstates here early to still
8faa8b077b2cdc Andi Kleen          2008-07-23  4190  	 * use the bootmem al=
locator.
8faa8b077b2cdc Andi Kleen          2008-07-23  4191  	 */
04adbc3f7bff40 Miaohe Lin          2021-05-04  4192  	if (hugetlb_max_hstat=
e && hstate_is_gigantic(parsed_hstate))
8faa8b077b2cdc Andi Kleen          2008-07-23  4193  		hugetlb_hstate_alloc=
_pages(parsed_hstate);
8faa8b077b2cdc Andi Kleen          2008-07-23  4194  =

8faa8b077b2cdc Andi Kleen          2008-07-23  4195  	last_mhp =3D mhp;
8faa8b077b2cdc Andi Kleen          2008-07-23  4196  =

a3437870160cf2 Nishanth Aravamudan 2008-07-23  4197  	return 1;
b5389086ad7be0 Zhenguo Yao         2021-11-05  4198  =

b5389086ad7be0 Zhenguo Yao         2021-11-05  4199  invalid:
b5389086ad7be0 Zhenguo Yao         2021-11-05  4200  	pr_warn("HugeTLB: Inv=
alid hugepages parameter %s\n", p);
b5389086ad7be0 Zhenguo Yao         2021-11-05  4201  	return 0;
a3437870160cf2 Nishanth Aravamudan 2008-07-23  4202  }
282f4214384ee2 Mike Kravetz        2020-06-03  4203  __setup("hugepages=3D"=
, hugepages_setup);
e11bfbfcb08ef4 Nicholas Piggin     2008-07-23  4204  =


:::::: The code at line 4170 was first introduced by commit
:::::: b5389086ad7be0453c55e0069a89856d1fbdf605 hugetlbfs: extend the defin=
ition of hugepages parameter to support node allocation

:::::: TO: Zhenguo Yao <yaozhenguo1@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3564954705187911107==--


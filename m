Content-Type: multipart/mixed; boundary="===============4463558043773918491=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/5] arch/x86/kvm: Refactor l1d flush lifecycle management
Date: Mon, 13 Apr 2020 17:49:41 +0800
Message-ID: <202004131723.uKknzs7f%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4463558043773918491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200408090229.16467-2-sblbir@amazon.com>
References: <20200408090229.16467-2-sblbir@amazon.com>
TO: Balbir Singh <sblbir@amazon.com>
CC: tglx(a)linutronix.de, linux-kernel(a)vger.kernel.org

Hi Balbir,

I love your patch! Perhaps something to improve:

[auto build test WARNING on kvm/linux-next]
[also build test WARNING on linus/master v5.7-rc1 next-20200413]
[cannot apply to tip/auto-latest tip/x86/mm tip/x86/core]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Balbir-Singh/Optionally-fl=
ush-L1D-on-context-switch/20200408-192153
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git linux-next
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> arch/x86/kernel/l1d_flush.c:25:26: warning: 'l1d_flush_pages' is of type=
 'void *'. When using void pointers in calculations, the behaviour is undef=
ined. [arithOperationsOnVoidPointer]
     memset(l1d_flush_pages + i * PAGE_SIZE, i + 1,
                            ^

# https://github.com/0day-ci/linux/commit/01f030960171a1eb6e3183aa69d002464=
fdb4194
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 01f030960171a1eb6e3183aa69d002464fdb4194
vim +25 arch/x86/kernel/l1d_flush.c

01f030960171a1 Balbir Singh 2020-04-08   3  =

01f030960171a1 Balbir Singh 2020-04-08   4  void *alloc_l1d_flush_pages(voi=
d)
01f030960171a1 Balbir Singh 2020-04-08   5  {
01f030960171a1 Balbir Singh 2020-04-08   6  	struct page *page;
01f030960171a1 Balbir Singh 2020-04-08   7  	void *l1d_flush_pages =3D NULL;
01f030960171a1 Balbir Singh 2020-04-08   8  	int i;
01f030960171a1 Balbir Singh 2020-04-08   9  =

01f030960171a1 Balbir Singh 2020-04-08  10  	/*
01f030960171a1 Balbir Singh 2020-04-08  11  	 * This allocation for l1d_flu=
sh_pages is not tied to a VM/task's
01f030960171a1 Balbir Singh 2020-04-08  12  	 * lifetime and so should not =
be charged to a memcg.
01f030960171a1 Balbir Singh 2020-04-08  13  	 */
01f030960171a1 Balbir Singh 2020-04-08  14  	page =3D alloc_pages(GFP_KERNE=
L, L1D_CACHE_ORDER);
01f030960171a1 Balbir Singh 2020-04-08  15  	if (!page)
01f030960171a1 Balbir Singh 2020-04-08  16  		return NULL;
01f030960171a1 Balbir Singh 2020-04-08  17  	l1d_flush_pages =3D page_addre=
ss(page);
01f030960171a1 Balbir Singh 2020-04-08  18  =

01f030960171a1 Balbir Singh 2020-04-08  19  	/*
01f030960171a1 Balbir Singh 2020-04-08  20  	 * Initialize each page with a=
 different pattern in
01f030960171a1 Balbir Singh 2020-04-08  21  	 * order to protect against KS=
M in the nested
01f030960171a1 Balbir Singh 2020-04-08  22  	 * virtualization case.
01f030960171a1 Balbir Singh 2020-04-08  23  	 */
01f030960171a1 Balbir Singh 2020-04-08  24  	for (i =3D 0; i < 1u << L1D_CA=
CHE_ORDER; ++i) {
01f030960171a1 Balbir Singh 2020-04-08 @25  		memset(l1d_flush_pages + i * =
PAGE_SIZE, i + 1,
01f030960171a1 Balbir Singh 2020-04-08  26  				PAGE_SIZE);
01f030960171a1 Balbir Singh 2020-04-08  27  	}
01f030960171a1 Balbir Singh 2020-04-08  28  	return l1d_flush_pages;
01f030960171a1 Balbir Singh 2020-04-08  29  }
01f030960171a1 Balbir Singh 2020-04-08  30  EXPORT_SYMBOL_GPL(alloc_l1d_flu=
sh_pages);
01f030960171a1 Balbir Singh 2020-04-08  31  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4463558043773918491==--


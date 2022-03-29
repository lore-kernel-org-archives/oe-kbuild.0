Content-Type: multipart/mixed; boundary="===============6175458700534685907=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [gustavoars:testing/kspp-stringop-overflow 5/5] arch/x86/mm/pgtable.c:442 pgd_alloc() error: uninitialized symbol 'pmds'.
Date: Tue, 29 Mar 2022 14:43:03 +0800
Message-ID: <202203291451.bKVdLfSv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6175458700534685907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.gi=
t testing/kspp-stringop-overflow
head:   d3becb16bbfe48ca524e4489b6c6c4fb1ccafa1a
commit: d3becb16bbfe48ca524e4489b6c6c4fb1ccafa1a [5/5] mm/pgtable: Fix Wstr=
ingop-overflow warnings in pgd_alloc()
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: i386-randconfig-m021-20220328 (https://download.01.org/0day-ci/arch=
ive/20220329/202203291451.bKVdLfSv-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/mm/pgtable.c:442 pgd_alloc() error: uninitialized symbol 'pmds'.
arch/x86/mm/pgtable.c:445 pgd_alloc() error: uninitialized symbol 'u_pmds'.

Old smatch warnings:
arch/x86/mm/pgtable.c:281 pgd_mop_up_pmds() warn: we never enter this loop

vim +/pmds +442 arch/x86/mm/pgtable.c

1ec1fe73dfb711 Ingo Molnar         2008-03-19  434  =

1db491f77b6ed0 Fenghua Yu          2015-01-15  435  	pgd =3D _pgd_alloc();
1ec1fe73dfb711 Ingo Molnar         2008-03-19  436  =

d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  437  	if (pgd =3D=3D NULL)
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  438  		goto out;
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  439  =

d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  440  	mm->pgd =3D pgd;
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  441  =

f59dbe9ca6707e Joerg Roedel        2018-07-18 @442  	if (preallocate_pmds(m=
m, pmds, PREALLOCATED_PMDS) !=3D 0)
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  443  		goto out_free_pgd;
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  444  =

f59dbe9ca6707e Joerg Roedel        2018-07-18 @445  	if (preallocate_pmds(m=
m, u_pmds, PREALLOCATED_USER_PMDS) !=3D 0)
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  446  		goto out_free_pmds;
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  447  =

f59dbe9ca6707e Joerg Roedel        2018-07-18  448  	if (paravirt_pgd_alloc=
(mm) !=3D 0)
f59dbe9ca6707e Joerg Roedel        2018-07-18  449  		goto out_free_user_pm=
ds;
f59dbe9ca6707e Joerg Roedel        2018-07-18  450  =

d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  451  	/*
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  452  	 * Make sure that pre-=
populating the pmds is atomic with
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  453  	 * respect to anything=
 walking the pgd_list, so that they
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  454  	 * never see a partial=
ly populated pgd.
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  455  	 */
a79e53d85683c6 Andrea Arcangeli    2011-02-16  456  	spin_lock(&pgd_lock);
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  457  =

617d34d9e5d832 Jeremy Fitzhardinge 2010-09-21  458  	pgd_ctor(mm, pgd);
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  459  	pgd_prepopulate_pmd(mm=
, pgd, pmds);
f59dbe9ca6707e Joerg Roedel        2018-07-18  460  	pgd_prepopulate_user_p=
md(mm, pgd, u_pmds);
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  461  =

a79e53d85683c6 Andrea Arcangeli    2011-02-16  462  	spin_unlock(&pgd_lock);
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  463  =

4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  464  	return pgd;
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  465  =

f59dbe9ca6707e Joerg Roedel        2018-07-18  466  out_free_user_pmds:
f59dbe9ca6707e Joerg Roedel        2018-07-18  467  	free_pmds(mm, u_pmds, =
PREALLOCATED_USER_PMDS);
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  468  out_free_pmds:
f59dbe9ca6707e Joerg Roedel        2018-07-18  469  	free_pmds(mm, pmds, PR=
EALLOCATED_PMDS);
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  470  out_free_pgd:
1db491f77b6ed0 Fenghua Yu          2015-01-15  471  	_pgd_free(pgd);
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  472  out:
d8d5900ef8afc5 Jeremy Fitzhardinge 2008-06-25  473  	return NULL;
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  474  }
4f76cd382213b2 Jeremy Fitzhardinge 2008-03-17  475  =


:::::: The code at line 442 was first introduced by commit
:::::: f59dbe9ca6707eb7ffd0e24359085651c2d7df48 x86/pgtable/pae: Use separa=
te kernel PMDs for user page-table

:::::: TO: Joerg Roedel <jroedel@suse.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6175458700534685907==--


Content-Type: multipart/mixed; boundary="===============2462600567882639844=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 14/45] mm: kmsan: maintain KMSAN metadata for page operations
Date: Sat, 02 Jul 2022 16:53:14 +0800
Message-ID: <202207021659.oyrS3dio-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2462600567882639844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220701142310.2188015-15-glider@google.com>
References: <20220701142310.2188015-15-glider@google.com>
TO: Alexander Potapenko <glider@google.com>
TO: glider(a)google.com
CC: Alexander Viro <viro@zeniv.linux.org.uk>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Andrey Konovalov <andreyknvl@google.com>
CC: Andy Lutomirski <luto@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Borislav Petkov <bp@alien8.de>
CC: Christoph Hellwig <hch@lst.de>
CC: Christoph Lameter <cl@linux-foundation.org>
CC: David Rientjes <rientjes@google.com>
CC: Dmitry Vyukov <dvyukov@google.com>
CC: Eric Dumazet <edumazet@google.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Ilya Leoshkevich <iii@linux.ibm.com>
CC: Ingo Molnar <mingo@redhat.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Joonsoo Kim <iamjoonsoo.kim@lge.com>
CC: Kees Cook <keescook@chromium.org>
CC: Marco Elver <elver@google.com>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Matthew Wilcox <willy@infradead.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Pekka Enberg <penberg@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Petr Mladek <pmladek@suse.com>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Thomas Gleixner <tglx@linutronix.de>

Hi Alexander,

I love your patch! Perhaps something to improve:

[auto build test WARNING on masahiroy-kbuild/for-next]
[also build test WARNING on linus/master v5.19-rc4 next-20220701]
[cannot apply to tip/x86/core tip/x86/mm]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Potapenko/=
Add-KernelMemorySanitizer-infrastructure/20220701-222712
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbu=
ild.git for-next
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20702/202207021659.oyrS3dio-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/vmalloc.c:440 __vunmap_range_noflush() warn: bitwise AND condition is fa=
lse here

vim +440 mm/vmalloc.c

c2febafc67734a Kirill A. Shutemov  2017-03-09  409  =

4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  410  /*
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  411   * vunmap_range_noflush=
 is similar to vunmap_range, but does not
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  412   * flush caches or TLBs.
b521c43f58e523 Christoph Hellwig   2020-06-01  413   *
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  414   * The caller is respon=
sible for calling flush_cache_vmap() before calling
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  415   * this function, and f=
lush_tlb_kernel_range after it has returned
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  416   * successfully (and be=
fore the addresses are expected to cause a page fault
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  417   * or be re-mapped for =
something else, if TLB flushes are being delayed or
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  418   * coalesced).
b521c43f58e523 Christoph Hellwig   2020-06-01  419   *
4ad0ae8c64ac8f Nicholas Piggin     2021-04-29  420   * This is an internal =
function only. Do not use outside mm/.
b521c43f58e523 Christoph Hellwig   2020-06-01  421   */
015e76716e50b4 Alexander Potapenko 2022-07-01  422  void __vunmap_range_nof=
lush(unsigned long start, unsigned long end)
^1da177e4c3f41 Linus Torvalds      2005-04-16  423  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  424  	unsigned long next;
b521c43f58e523 Christoph Hellwig   2020-06-01  425  	pgd_t *pgd;
2ba3e6947aed9b Joerg Roedel        2020-06-01  426  	unsigned long addr =3D=
 start;
2ba3e6947aed9b Joerg Roedel        2020-06-01  427  	pgtbl_mod_mask mask =
=3D 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  428  =

^1da177e4c3f41 Linus Torvalds      2005-04-16  429  	BUG_ON(addr >=3D end);
^1da177e4c3f41 Linus Torvalds      2005-04-16  430  	pgd =3D pgd_offset_k(a=
ddr);
^1da177e4c3f41 Linus Torvalds      2005-04-16  431  	do {
^1da177e4c3f41 Linus Torvalds      2005-04-16  432  		next =3D pgd_addr_end=
(addr, end);
2ba3e6947aed9b Joerg Roedel        2020-06-01  433  		if (pgd_bad(*pgd))
2ba3e6947aed9b Joerg Roedel        2020-06-01  434  			mask |=3D PGTBL_PGD_=
MODIFIED;
^1da177e4c3f41 Linus Torvalds      2005-04-16  435  		if (pgd_none_or_clear=
_bad(pgd))
^1da177e4c3f41 Linus Torvalds      2005-04-16  436  			continue;
2ba3e6947aed9b Joerg Roedel        2020-06-01  437  		vunmap_p4d_range(pgd,=
 addr, next, &mask);
^1da177e4c3f41 Linus Torvalds      2005-04-16  438  	} while (pgd++, addr =
=3D next, addr !=3D end);
2ba3e6947aed9b Joerg Roedel        2020-06-01  439  =

2ba3e6947aed9b Joerg Roedel        2020-06-01 @440  	if (mask & ARCH_PAGE_T=
ABLE_SYNC_MASK)
2ba3e6947aed9b Joerg Roedel        2020-06-01  441  		arch_sync_kernel_mapp=
ings(start, end);
^1da177e4c3f41 Linus Torvalds      2005-04-16  442  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  443  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2462600567882639844==--


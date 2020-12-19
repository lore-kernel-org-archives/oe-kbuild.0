Content-Type: multipart/mixed; boundary="===============8655461844141220088=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/userfaultfd.c:1849:9: warning: Identical condition 'ret', second condition is always false
Date: Sun, 20 Dec 2020 03:05:19 +0800
Message-ID: <202012200311.P7nv34C7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8655461844141220088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andrea Arcangeli <aarcange@redhat.com>
CC: Peter Xu <peterx@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Jerome Glisse <jglisse@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3644e2d2dda78e21edd8f5415b6d7ab03f5f54f3
commit: 63b2d4174c4ad1f40b48d7138e71bcb564c1fe03 userfaultfd: wp: add the w=
riteprotect API to userfaultfd ioctl
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   fs/userfaultfd.c:417:40: warning: Boolean result is used in bitwise oper=
ation. Clarify expression with parentheses. [clarifyCondition]
    VM_BUG_ON(!(reason & VM_UFFD_MISSING) ^ !!(reason & VM_UFFD_WP));
                                          ^
   fs/userfaultfd.c:902:40: warning: Boolean result is used in bitwise oper=
ation. Clarify expression with parentheses. [clarifyCondition]
     BUG_ON(!!vma->vm_userfaultfd_ctx.ctx ^
                                          ^
   fs/userfaultfd.c:1379:40: warning: Boolean result is used in bitwise ope=
ration. Clarify expression with parentheses. [clarifyCondition]
     BUG_ON(!!cur->vm_userfaultfd_ctx.ctx ^
                                          ^
   fs/userfaultfd.c:1571:40: warning: Boolean result is used in bitwise ope=
ration. Clarify expression with parentheses. [clarifyCondition]
     BUG_ON(!!cur->vm_userfaultfd_ctx.ctx ^
                                          ^
>> fs/userfaultfd.c:1849:9: warning: Identical condition 'ret', second cond=
ition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   fs/userfaultfd.c:1841:6: note: first condition
    if (ret)
        ^
   fs/userfaultfd.c:1849:9: note: second condition
    return ret;
           ^

vim +/ret +1849 fs/userfaultfd.c

ad465cae96b456b Andrea Arcangeli 2015-09-04  1807  =

63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1808  static int userfaultfd_w=
riteprotect(struct userfaultfd_ctx *ctx,
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1809  				    unsigned long ar=
g)
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1810  {
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1811  	int ret;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1812  	struct uffdio_writeprot=
ect uffdio_wp;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1813  	struct uffdio_writeprot=
ect __user *user_uffdio_wp;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1814  	struct userfaultfd_wake=
_range range;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1815  =

63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1816  	if (READ_ONCE(ctx->mmap=
_changing))
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1817  		return -EAGAIN;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1818  =

63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1819  	user_uffdio_wp =3D (str=
uct uffdio_writeprotect __user *) arg;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1820  =

63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1821  	if (copy_from_user(&uff=
dio_wp, user_uffdio_wp,
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1822  			   sizeof(struct uffd=
io_writeprotect)))
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1823  		return -EFAULT;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1824  =

63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1825  	ret =3D validate_range(=
ctx->mm, &uffdio_wp.range.start,
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1826  			     uffdio_wp.range.=
len);
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1827  	if (ret)
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1828  		return ret;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1829  =

63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1830  	if (uffdio_wp.mode & ~(=
UFFDIO_WRITEPROTECT_MODE_DONTWAKE |
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1831  			       UFFDIO_WRITEPR=
OTECT_MODE_WP))
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1832  		return -EINVAL;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1833  	if ((uffdio_wp.mode & U=
FFDIO_WRITEPROTECT_MODE_WP) &&
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1834  	     (uffdio_wp.mode & =
UFFDIO_WRITEPROTECT_MODE_DONTWAKE))
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1835  		return -EINVAL;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1836  =

63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1837  	ret =3D mwriteprotect_r=
ange(ctx->mm, uffdio_wp.range.start,
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1838  				  uffdio_wp.range.le=
n, uffdio_wp.mode &
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1839  				  UFFDIO_WRITEPROTEC=
T_MODE_WP,
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1840  				  &ctx->mmap_changin=
g);
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1841  	if (ret)
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1842  		return ret;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1843  =

63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1844  	if (!(uffdio_wp.mode & =
UFFDIO_WRITEPROTECT_MODE_DONTWAKE)) {
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1845  		range.start =3D uffdio=
_wp.range.start;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1846  		range.len =3D uffdio_w=
p.range.len;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1847  		wake_userfault(ctx, &r=
ange);
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1848  	}
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06 @1849  	return ret;
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1850  }
63b2d4174c4ad1f Andrea Arcangeli 2020-04-06  1851  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8655461844141220088==--


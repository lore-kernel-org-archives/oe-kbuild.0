Content-Type: multipart/mixed; boundary="===============0165081854190874518=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/8] mm: thp: only regular file could be THP eligible
Date: Wed, 02 Mar 2022 00:57:58 +0800
Message-ID: <202203020034.2Ii9kTrs-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0165081854190874518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220228235741.102941-5-shy828301@gmail.com>
References: <20220228235741.102941-5-shy828301@gmail.com>
TO: Yang Shi <shy828301@gmail.com>
TO: vbabka(a)suse.cz
TO: kirill.shutemov(a)linux.intel.com
TO: songliubraving(a)fb.com
TO: linmiaohe(a)huawei.com
TO: riel(a)surriel.com
TO: willy(a)infradead.org
TO: ziy(a)nvidia.com
TO: akpm(a)linux-foundation.org
TO: tytso(a)mit.edu
TO: adilger.kernel(a)dilger.ca
TO: darrick.wong(a)oracle.com
CC: linux-mm(a)kvack.org
CC: linux-fsdevel(a)vger.kernel.org
CC: linux-ext4(a)vger.kernel.org
CC: linux-xfs(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Yang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on xfs-linux/for-next linus/master v5.17-rc6 next-=
20220301]
[cannot apply to hnaz-mm/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yang-Shi/Make-khugepaged-c=
ollapse-readonly-FS-THP-more-consistent/20220301-075903
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-randconfig-m031-20220227 (https://download.01.org/0day-ci/arc=
hive/20220302/202203020034.2Ii9kTrs-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
include/linux/huge_mm.h:179 file_thp_enabled() warn: variable dereferenced =
before check 'vma->vm_file' (see line 177)
mm/khugepaged.c:468 hugepage_vma_check() error: we previously assumed 'vma-=
>vm_file' could be null (see line 455)
include/linux/huge_mm.h:179 file_thp_enabled() warn: variable dereferenced =
before check 'vma->vm_file' (see line 177)

vim +179 include/linux/huge_mm.h

16981d763501c0 Dan Williams 2017-07-10  174  =

2224ed1155c07b Yang Shi     2022-02-28  175  static inline bool file_thp_en=
abled(struct vm_area_struct *vma)
2224ed1155c07b Yang Shi     2022-02-28  176  {
2224ed1155c07b Yang Shi     2022-02-28 @177  	struct inode *inode =3D vma->=
vm_file->f_inode;
2224ed1155c07b Yang Shi     2022-02-28  178  =

2224ed1155c07b Yang Shi     2022-02-28 @179  	return (IS_ENABLED(CONFIG_REA=
D_ONLY_THP_FOR_FS)) && vma->vm_file &&
2224ed1155c07b Yang Shi     2022-02-28  180  	       (vma->vm_flags & VM_EX=
EC) &&
2224ed1155c07b Yang Shi     2022-02-28  181  	       !inode_is_open_for_wri=
te(inode) && S_ISREG(inode->i_mode);
2224ed1155c07b Yang Shi     2022-02-28  182  }
2224ed1155c07b Yang Shi     2022-02-28  183  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0165081854190874518==--


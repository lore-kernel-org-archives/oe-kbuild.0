Content-Type: multipart/mixed; boundary="===============4360361956428725653=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] f2fs: Handle casefolding with Encryption
Date: Tue, 17 Nov 2020 20:55:55 +0800
Message-ID: <202011172058.arXnofQK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4360361956428725653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20201117040315.28548-4-drosen@google.com>
References: <20201117040315.28548-4-drosen@google.com>
TO: Daniel Rosenberg <drosen@google.com>

Hi Daniel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on f2fs/dev-test]
[also build test WARNING on ext4/dev linus/master v5.10-rc4 next-20201117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Rosenberg/Add-suppo=
rt-for-Encryption-and-Casefolding-in-F2FS/20201117-120753
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git de=
v-test
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
compiler: aarch64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/f2fs/dir.c:206:3: warning: Assignment of function parameter has no ef=
fect outside the function. Did you forget dereferencing it? [uselessAssignm=
entPtrArg]
     dentry_page =3D ERR_CAST(res);
     ^
   fs/f2fs/f2fs.h:2200:15: warning: Local variable valid_node_count shadows=
 outer function [shadowFunction]
    unsigned int valid_node_count, user_block_count;
                 ^
   fs/f2fs/f2fs.h:2296:28: note: Shadowed declaration
   static inline unsigned int valid_node_count(struct f2fs_sb_info *sbi)
                              ^
   fs/f2fs/f2fs.h:2200:15: note: Shadow variable
    unsigned int valid_node_count, user_block_count;
                 ^

vim +206 fs/f2fs/dir.c

6b4ea0160ae236a Jaegeuk Kim      2012-11-14  191  =

2c2eb7a300cd7c6 Daniel Rosenberg 2019-07-23  192  static struct f2fs_dir_en=
try *find_in_block(struct inode *dir,
2c2eb7a300cd7c6 Daniel Rosenberg 2019-07-23  193  				struct page *dentry_p=
age,
43c780ba26244e4 Eric Biggers     2020-05-07  194  				const struct f2fs_fil=
ename *fname,
17f930e0a649e15 Chao Yu          2020-09-26  195  				int *max_slots)
4e6ebf6d4935914 Jaegeuk Kim      2014-10-13  196  {
4e6ebf6d4935914 Jaegeuk Kim      2014-10-13  197  	struct f2fs_dentry_block=
 *dentry_blk;
7b3cd7d6f026784 Jaegeuk Kim      2014-10-18  198  	struct f2fs_dentry_ptr d;
6f0a1d1d8d24e7e Daniel Rosenberg 2020-11-17  199  	struct f2fs_dir_entry *r=
es;
4e6ebf6d4935914 Jaegeuk Kim      2014-10-13  200  =

bdbc90fa55af632 Yunlong Song     2018-02-28  201  	dentry_blk =3D (struct f=
2fs_dentry_block *)page_address(dentry_page);
7b3cd7d6f026784 Jaegeuk Kim      2014-10-18  202  =

2c2eb7a300cd7c6 Daniel Rosenberg 2019-07-23  203  	make_dentry_ptr_block(di=
r, &d, dentry_blk);
6f0a1d1d8d24e7e Daniel Rosenberg 2020-11-17  204  	res =3D f2fs_find_target=
_dentry(&d, fname, max_slots);
6f0a1d1d8d24e7e Daniel Rosenberg 2020-11-17  205  	if (IS_ERR(res)) {
6f0a1d1d8d24e7e Daniel Rosenberg 2020-11-17 @206  		dentry_page =3D ERR_CAS=
T(res);
6f0a1d1d8d24e7e Daniel Rosenberg 2020-11-17  207  		res =3D NULL;
6f0a1d1d8d24e7e Daniel Rosenberg 2020-11-17  208  	}
6f0a1d1d8d24e7e Daniel Rosenberg 2020-11-17  209  	return res;
4e6ebf6d4935914 Jaegeuk Kim      2014-10-13  210  }
4e6ebf6d4935914 Jaegeuk Kim      2014-10-13  211  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4360361956428725653==--


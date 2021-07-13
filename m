Content-Type: multipart/mixed; boundary="===============5833391377433751480=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/5] ext4: Move orphan inode handling into a separate file
Date: Tue, 13 Jul 2021 12:49:01 +0800
Message-ID: <202107131249.1tMU7PrQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5833391377433751480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210712154009.9290-3-jack@suse.cz>
References: <20210712154009.9290-3-jack@suse.cz>
TO: Jan Kara <jack@suse.cz>
TO: Ted Tso <tytso@mit.edu>
CC: linux-ext4(a)vger.kernel.org
CC: Jan Kara <jack@suse.cz>
CC: Andreas Dilger <adilger@dilger.ca>

Hi Jan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on ext3/for_next]
[cannot apply to ext4/dev linus/master tytso-fscrypt/master v5.14-rc1 next-=
20210712]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jan-Kara/ext4-Speedup-orph=
an-file-handling/20210712-234039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git f=
or_next
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/ext4/orphan.c:
>> fs/ext4/orphan.c:323:5: warning: Identical inner 'if' condition is alway=
s true. [identicalInnerCondition]
       ext4_std_error(inode->i_sb, ret);
       ^
   fs/ext4/orphan.c:322:8: note: outer condition: ret
      if (ret)
          ^
   fs/ext4/orphan.c:323:5: note: identical inner condition: ret
       ext4_std_error(inode->i_sb, ret);
       ^

vim +/if +323 fs/ext4/orphan.c

bf840f6979494a Jan Kara 2021-07-12  290  =

bf840f6979494a Jan Kara 2021-07-12  291  	while (es->s_last_orphan) {
bf840f6979494a Jan Kara 2021-07-12  292  		struct inode *inode;
bf840f6979494a Jan Kara 2021-07-12  293  =

bf840f6979494a Jan Kara 2021-07-12  294  		/*
bf840f6979494a Jan Kara 2021-07-12  295  		 * We may have encountered an er=
ror during cleanup; if
bf840f6979494a Jan Kara 2021-07-12  296  		 * so, skip the rest.
bf840f6979494a Jan Kara 2021-07-12  297  		 */
bf840f6979494a Jan Kara 2021-07-12  298  		if (EXT4_SB(sb)->s_mount_state &=
 EXT4_ERROR_FS) {
bf840f6979494a Jan Kara 2021-07-12  299  			jbd_debug(1, "Skipping orphan r=
ecovery on fs with errors.\n");
bf840f6979494a Jan Kara 2021-07-12  300  			es->s_last_orphan =3D 0;
bf840f6979494a Jan Kara 2021-07-12  301  			break;
bf840f6979494a Jan Kara 2021-07-12  302  		}
bf840f6979494a Jan Kara 2021-07-12  303  =

bf840f6979494a Jan Kara 2021-07-12  304  		inode =3D ext4_orphan_get(sb, le=
32_to_cpu(es->s_last_orphan));
bf840f6979494a Jan Kara 2021-07-12  305  		if (IS_ERR(inode)) {
bf840f6979494a Jan Kara 2021-07-12  306  			es->s_last_orphan =3D 0;
bf840f6979494a Jan Kara 2021-07-12  307  			break;
bf840f6979494a Jan Kara 2021-07-12  308  		}
bf840f6979494a Jan Kara 2021-07-12  309  =

bf840f6979494a Jan Kara 2021-07-12  310  		list_add(&EXT4_I(inode)->i_orpha=
n, &EXT4_SB(sb)->s_orphan);
bf840f6979494a Jan Kara 2021-07-12  311  		dquot_initialize(inode);
bf840f6979494a Jan Kara 2021-07-12  312  		if (inode->i_nlink) {
bf840f6979494a Jan Kara 2021-07-12  313  			if (test_opt(sb, DEBUG))
bf840f6979494a Jan Kara 2021-07-12  314  				ext4_msg(sb, KERN_DEBUG,
bf840f6979494a Jan Kara 2021-07-12  315  					"%s: truncating inode %lu to =
%lld bytes",
bf840f6979494a Jan Kara 2021-07-12  316  					__func__, inode->i_ino, inode=
->i_size);
bf840f6979494a Jan Kara 2021-07-12  317  			jbd_debug(2, "truncating inode =
%lu to %lld bytes\n",
bf840f6979494a Jan Kara 2021-07-12  318  				  inode->i_ino, inode->i_size);
bf840f6979494a Jan Kara 2021-07-12  319  			inode_lock(inode);
bf840f6979494a Jan Kara 2021-07-12  320  			truncate_inode_pages(inode->i_m=
apping, inode->i_size);
bf840f6979494a Jan Kara 2021-07-12  321  			ret =3D ext4_truncate(inode);
bf840f6979494a Jan Kara 2021-07-12  322  			if (ret)
bf840f6979494a Jan Kara 2021-07-12 @323  				ext4_std_error(inode->i_sb, re=
t);
bf840f6979494a Jan Kara 2021-07-12  324  			inode_unlock(inode);
bf840f6979494a Jan Kara 2021-07-12  325  			nr_truncates++;
bf840f6979494a Jan Kara 2021-07-12  326  		} else {
bf840f6979494a Jan Kara 2021-07-12  327  			if (test_opt(sb, DEBUG))
bf840f6979494a Jan Kara 2021-07-12  328  				ext4_msg(sb, KERN_DEBUG,
bf840f6979494a Jan Kara 2021-07-12  329  					"%s: deleting unreferenced in=
ode %lu",
bf840f6979494a Jan Kara 2021-07-12  330  					__func__, inode->i_ino);
bf840f6979494a Jan Kara 2021-07-12  331  			jbd_debug(2, "deleting unrefere=
nced inode %lu\n",
bf840f6979494a Jan Kara 2021-07-12  332  				  inode->i_ino);
bf840f6979494a Jan Kara 2021-07-12  333  			nr_orphans++;
bf840f6979494a Jan Kara 2021-07-12  334  		}
bf840f6979494a Jan Kara 2021-07-12  335  		iput(inode);  /* The delete magi=
c happens here! */
bf840f6979494a Jan Kara 2021-07-12  336  	}
bf840f6979494a Jan Kara 2021-07-12  337  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5833391377433751480==--


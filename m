Content-Type: multipart/mixed; boundary="===============5565736101483040511=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] fs: introduce lock_rename_child() helper
Date: Fri, 29 Apr 2022 09:46:21 +0800
Message-ID: <202204290929.1ZsztOY6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5565736101483040511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220427023245.7327-2-linkinjeon@kernel.org>
References: <20220427023245.7327-2-linkinjeon@kernel.org>
TO: Namjae Jeon <linkinjeon@kernel.org>
TO: linux-cifs(a)vger.kernel.org
TO: linux-fsdevel(a)vger.kernel.org
CC: smfrench(a)gmail.com
CC: hyc.lee(a)gmail.com
CC: senozhatsky(a)chromium.org
CC: Al Viro <viro@zeniv.linux.org.uk>
CC: Namjae Jeon <linkinjeon@kernel.org>

Hi Namjae,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.18-rc4 next-20220428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Namjae-Jeon/ksmbd-re=
move-internal-h-include/20220427-103452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
46cf2c613f4b10eb12f749207b0fd2c1bfae3088
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20220425 (https://download.01.org/0day-ci/ar=
chive/20220429/202204290929.1ZsztOY6-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/namei.c:3011 lock_rename_child() warn: inconsistent returns '&c1->d_sb->=
s_vfs_rename_mutex'.

Old smatch warnings:
fs/namei.c:1577 lookup_dcache() warn: passing zero to 'ERR_PTR'
fs/namei.c:1674 lookup_fast() warn: passing zero to 'ERR_PTR'
fs/namei.c:2202 hash_name() error: uninitialized symbol 'bdata'.
fs/namei.c:3447 open_last_lookups() error: uninitialized symbol 'inode'.
fs/namei.c:3447 open_last_lookups() error: uninitialized symbol 'seq'.

vim +3011 fs/namei.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  2994  =

ff7e30da72593b Al Viro        2022-04-27  2995  struct dentry *lock_rename_=
child(struct dentry *c1, struct dentry *p2)
ff7e30da72593b Al Viro        2022-04-27  2996  {
ff7e30da72593b Al Viro        2022-04-27  2997  	if (READ_ONCE(c1->d_parent=
) =3D=3D p2) {
ff7e30da72593b Al Viro        2022-04-27  2998  		inode_lock_nested(p2->d_i=
node, I_MUTEX_PARENT);
ff7e30da72593b Al Viro        2022-04-27  2999  		if (likely(c1->d_parent =
=3D=3D p2))
ff7e30da72593b Al Viro        2022-04-27  3000  			return NULL;
ff7e30da72593b Al Viro        2022-04-27  3001  =

ff7e30da72593b Al Viro        2022-04-27  3002  		inode_unlock(p2->d_inode);
ff7e30da72593b Al Viro        2022-04-27  3003  	}
ff7e30da72593b Al Viro        2022-04-27  3004  =

ff7e30da72593b Al Viro        2022-04-27  3005  	mutex_lock(&c1->d_sb->s_vf=
s_rename_mutex);
ff7e30da72593b Al Viro        2022-04-27  3006  	if (likely(c1->d_parent !=
=3D p2))
ff7e30da72593b Al Viro        2022-04-27  3007  		return lock_two_directori=
es(c1->d_parent, p2);
ff7e30da72593b Al Viro        2022-04-27  3008  =

ff7e30da72593b Al Viro        2022-04-27  3009  	inode_lock_nested(p2->d_in=
ode, I_MUTEX_PARENT);
ff7e30da72593b Al Viro        2022-04-27  3010  	mutex_unlock(&c1->d_sb->s_=
vfs_rename_mutex);
ff7e30da72593b Al Viro        2022-04-27 @3011  	return NULL;
ff7e30da72593b Al Viro        2022-04-27  3012  }
ff7e30da72593b Al Viro        2022-04-27  3013  EXPORT_SYMBOL(lock_rename_c=
hild);
ff7e30da72593b Al Viro        2022-04-27  3014  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5565736101483040511==--


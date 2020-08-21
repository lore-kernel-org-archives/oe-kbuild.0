Content-Type: multipart/mixed; boundary="===============5691062667356865747=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] fs: Kill DCACHE_DONTCACHE dentry even if DCACHE_REFERENCED is set
Date: Fri, 21 Aug 2020 13:05:09 +0800
Message-ID: <202008211338.qLvIozpJ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5691062667356865747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200821015953.22956-1-lihao2018.fnst@cn.fujitsu.com>
References: <20200821015953.22956-1-lihao2018.fnst@cn.fujitsu.com>
TO: Hao Li <lihao2018.fnst@cn.fujitsu.com>
TO: viro(a)zeniv.linux.org.uk
CC: linux-fsdevel(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: lihao2018.fnst(a)cn.fujitsu.com
CC: y-goto(a)fujitsu.com

Hi Hao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.9-rc1 next-20200820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hao-Li/fs-Kill-DCACHE_DONT=
CACHE-dentry-even-if-DCACHE_REFERENCED-is-set/20200821-100150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
da2968ff879b9e74688cdc658f646971991d2c56
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/inode.c:1635:12: warning: Redundant condition: drop. '!drop || (drop =
&& inode->i_state&I_DONTCACHE)' is equivalent to '!drop || inode->i_state&I=
_DONTCACHE' [redundantCondition]
    if (!drop || (drop && (inode->i_state & I_DONTCACHE))) {
              ^

# https://github.com/0day-ci/linux/commit/a8546f9cc4d4e53039ed586f058444cec=
e207711
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Hao-Li/fs-Kill-DCACHE_DONTCACHE-dentry-eve=
n-if-DCACHE_REFERENCED-is-set/20200821-100150
git checkout a8546f9cc4d4e53039ed586f058444cece207711
vim +1635 fs/inode.c

45321ac54316ea Al Viro        2010-06-07  1603  =

45321ac54316ea Al Viro        2010-06-07  1604  /*
45321ac54316ea Al Viro        2010-06-07  1605   * Called when we're droppi=
ng the last reference
45321ac54316ea Al Viro        2010-06-07  1606   * to an inode.
22fe4042181563 Jan Kara       2009-09-18  1607   *
45321ac54316ea Al Viro        2010-06-07  1608   * Call the FS "drop_inode(=
)" function, defaulting to
45321ac54316ea Al Viro        2010-06-07  1609   * the legacy UNIX filesyst=
em behaviour.  If it tells
45321ac54316ea Al Viro        2010-06-07  1610   * us to evict inode, do so=
.  Otherwise, retain inode
45321ac54316ea Al Viro        2010-06-07  1611   * in cache if fs is alive,=
 sync and evict if fs is
45321ac54316ea Al Viro        2010-06-07  1612   * shutting down.
22fe4042181563 Jan Kara       2009-09-18  1613   */
45321ac54316ea Al Viro        2010-06-07  1614  static void iput_final(stru=
ct inode *inode)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1615  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1616  	struct super_block *sb =3D=
 inode->i_sb;
45321ac54316ea Al Viro        2010-06-07  1617  	const struct super_operati=
ons *op =3D inode->i_sb->s_op;
3f19b2ab97a97b David Howells  2017-12-01  1618  	unsigned long state;
45321ac54316ea Al Viro        2010-06-07  1619  	int drop;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1620  =

250df6ed274d76 Dave Chinner   2011-03-22  1621  	WARN_ON(inode->i_state & I=
_NEW);
250df6ed274d76 Dave Chinner   2011-03-22  1622  =

e7f59097071f2e Al Viro        2011-07-07  1623  	if (op->drop_inode)
45321ac54316ea Al Viro        2010-06-07  1624  		drop =3D op->drop_inode(i=
node);
45321ac54316ea Al Viro        2010-06-07  1625  	else
45321ac54316ea Al Viro        2010-06-07  1626  		drop =3D generic_drop_ino=
de(inode);
45321ac54316ea Al Viro        2010-06-07  1627  =

1751e8a6cb935e Linus Torvalds 2017-11-27  1628  	if (!drop && (sb->s_flags =
& SB_ACTIVE)) {
4eff96dd5283a1 Jan Kara       2012-11-26  1629  		inode_add_lru(inode);
250df6ed274d76 Dave Chinner   2011-03-22  1630  		spin_unlock(&inode->i_loc=
k);
45321ac54316ea Al Viro        2010-06-07  1631  		return;
991114c6fa6a21 Alexander Viro 2005-06-23  1632  	}
b2b2af8e614b4d Dave Chinner   2011-03-22  1633  =

3f19b2ab97a97b David Howells  2017-12-01  1634  	state =3D inode->i_state;
a8546f9cc4d4e5 Hao Li         2020-08-21 @1635  	if (!drop || (drop && (ino=
de->i_state & I_DONTCACHE))) {
3f19b2ab97a97b David Howells  2017-12-01  1636  		WRITE_ONCE(inode->i_state=
, state | I_WILL_FREE);
250df6ed274d76 Dave Chinner   2011-03-22  1637  		spin_unlock(&inode->i_loc=
k);
3f19b2ab97a97b David Howells  2017-12-01  1638  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1639  		write_inode_now(inode, 1);
3f19b2ab97a97b David Howells  2017-12-01  1640  =

250df6ed274d76 Dave Chinner   2011-03-22  1641  		spin_lock(&inode->i_lock);
3f19b2ab97a97b David Howells  2017-12-01  1642  		state =3D inode->i_state;
3f19b2ab97a97b David Howells  2017-12-01  1643  		WARN_ON(state & I_NEW);
3f19b2ab97a97b David Howells  2017-12-01  1644  		state &=3D ~I_WILL_FREE;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1645  	}
7ccf19a8042e34 Nick Piggin    2010-10-21  1646  =

3f19b2ab97a97b David Howells  2017-12-01  1647  	WRITE_ONCE(inode->i_state,=
 state | I_FREEING);
c4ae0c65455c1b Eric Dumazet   2011-07-28  1648  	if (!list_empty(&inode->i_=
lru))
9e38d86ff2d8a8 Nick Piggin    2010-10-23  1649  		inode_lru_list_del(inode);
b2b2af8e614b4d Dave Chinner   2011-03-22  1650  	spin_unlock(&inode->i_lock=
);
b2b2af8e614b4d Dave Chinner   2011-03-22  1651  =

644da5960ded13 Al Viro        2010-06-07  1652  	evict(inode);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1653  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1654  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5691062667356865747==--


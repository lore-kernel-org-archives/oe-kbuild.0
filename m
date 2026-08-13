Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FE63242AC
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 04:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786595641; cv=none; b=KrApM1tRZQauoh8C/a7tIL8secdlc8TxkP9sImGUzAoViz7p2U+2NVtwBfgLo+TCMFyfAj4HZIdayAdnL8Ja1zBZSLxATQvg41F5BdqiueM4bCNn98MDPcICLJIqY9EhHrF77J01xUxlMxXmo5tft9wYLqfh/bPJTkIGOxwiqa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786595641; c=relaxed/simple;
	bh=24jlb9PYk2nyTWqe1did/oseDJEXhZ+lUlSQsIbEQK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VO0doUOhm+FKWLJuamawdVG0c7wzrGV0lia57K9Xz+NRWoU7ag1ej7gaJa5CbbOCIwP+5PSoiRSmXXLRqNL+n3DgOZ3mINKTvIO6iwdZKJf75ZLQ9w9z88rKayx9jfQeum/O62M+Ihg5t3278WodVDNO8iVDkz1NHw8z1CABCCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDDy6Mm4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDDy6Mm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786595638; x=1818131638;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=24jlb9PYk2nyTWqe1did/oseDJEXhZ+lUlSQsIbEQK4=;
  b=oDDy6Mm4Iwj7Xdzr3uH+lTVwEAQRMZhnVk9Z2b9juYxEEFPCgabrtpnA
   cUBsFlUlEI5L2JNaSIOs647LRGphPoQZkGF02HnRU1xiaZT8xny+t3/62
   jekQ85k3uQ5vOEuGz/gRoPmJPSH/Y5z1sxCfV7HkHe92Ib6zrKbCQwgHm
   Le7didrMZXGyCpZTKoz6yxo6WCx+sG5pjuTULicqx8VJHcFa+++4UH058
   EoIiHj2dEzfMSRkvlRJPt0Ntx4hrrQnTVz382A1kg/b3AfJXtd3fpoQRC
   X9NA3XhFj3DzAuaQuaTPyfiwjJDGGwS1D1GqVU0FkI5bLBX6C13OjREL4
   A==;
X-CSE-ConnectionGUID: c8ep2g/4St+XDwVn9WMxvw==
X-CSE-MsgGUID: XUukB895SaeCRJFyAh3+Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="112705670"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="112705670"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 21:33:54 -0700
X-CSE-ConnectionGUID: DjiBZ/p3QoOGoGj1QXidqg==
X-CSE-MsgGUID: HbubWhBNQ/KCTNaQIh5YvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="302094341"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Aug 2026 21:33:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuN8Z-00000000SpM-0lAd;
	Thu, 13 Aug 2026 04:33:51 +0000
Date: Thu, 13 Aug 2026 12:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linuxsecuritymodule:dev-staging 8/8]
 security/lsm_audit.c:185:2: error: call to '__compiletime_assert_721'
 declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(a->u) >
 sizeof(void *)*2
Message-ID: <202608131245.zNF4czm3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "__compiletime_assert_NNN"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Micka=C3=ABl Sala=C3=BCn" <mic@digikod.net>
CC: Paul Moore <paul@paul-moore.com>
CC: Christian Brauner <brauner@kernel.org>
CC: "G=C3=BCnther Noack" <gnoack@google.com>

tree:   https://github.com/LinuxSecurityModule/kernel dev-staging
head:   1f2f7a1fd1fc34e757107e3a3849f8d22b14cc6b
commit: 1f2f7a1fd1fc34e757107e3a3849f8d22b14cc6b [8/8] lsm: add LSM_AUDIT_D=
ATA_NS for namespace audit records
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: hexagon-randconfig-002-20260813 (https://download.01.org/0day-ci/ar=
chive/20260813/202608131245.zNF4czm3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260813/202608131245.zNF4czm3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608131245.zNF4czm3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/lsm_audit.c:185:2: error: call to '__compiletime_assert_721' de=
clared with 'error' attribute: BUILD_BUG_ON failed: sizeof(a->u) > sizeof(v=
oid *)*2
     185 |         BUILD_BUG_ON(sizeof(a->u) > sizeof(void *)*2);
         |         ^
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #con=
dition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compile=
time_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compil=
etime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compi=
letime_assert'
     683 |                         prefix ## suffix();                     =
        \
         |                         ^
   <scratch space>:2:1: note: expanded from here
       2 | __compiletime_assert_721
         | ^
>> security/lsm_audit.c:185:2: error: call to '__compiletime_assert_721' de=
clared with 'error' attribute: BUILD_BUG_ON failed: sizeof(a->u) > sizeof(v=
oid *)*2
   include/linux/build_bug.h:51:2: note: expanded from macro 'BUILD_BUG_ON'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #con=
dition)
         |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compile=
time_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compil=
etime_assert'
     690 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compi=
letime_assert'
     683 |                         prefix ## suffix();                     =
        \
         |                         ^
   <scratch space>:2:1: note: expanded from here
       2 | __compiletime_assert_721
         | ^
   2 errors generated.


vim +185 security/lsm_audit.c

6e837fb152410e Etienne Basset     2009-04-08  171 =20
6e837fb152410e Etienne Basset     2009-04-08  172  /**
9b08a16637eeef Micka=C3=ABl Sala=C3=BCn     2025-03-20  173   * audit_log_l=
sm_data - helper to log common LSM audit data
610b17b05c5c68 Bo Liu             2022-10-25  174   * @ab : the audit buffer
6e837fb152410e Etienne Basset     2009-04-08  175   * @a : common audit data
6e837fb152410e Etienne Basset     2009-04-08  176   */
9b08a16637eeef Micka=C3=ABl Sala=C3=BCn     2025-03-20  177  void audit_log=
_lsm_data(struct audit_buffer *ab,
9b08a16637eeef Micka=C3=ABl Sala=C3=BCn     2025-03-20  178  			const struc=
t common_audit_data *a)
6e837fb152410e Etienne Basset     2009-04-08  179  {
07f62eb66c6626 Eric Paris         2012-04-04  180  	/*
4432b507445acf Paul Moore         2023-05-24  181  	 * To keep stack sizes =
in check force programmers to notice if they
07f62eb66c6626 Eric Paris         2012-04-04  182  	 * start making this un=
ion too large!  See struct lsm_network_audit
07f62eb66c6626 Eric Paris         2012-04-04  183  	 * as an example of how=
 to deal with large data.
07f62eb66c6626 Eric Paris         2012-04-04  184  	 */
07f62eb66c6626 Eric Paris         2012-04-04 @185  	BUILD_BUG_ON(sizeof(a->=
u) > sizeof(void *)*2);
07f62eb66c6626 Eric Paris         2012-04-04  186 =20
6e837fb152410e Etienne Basset     2009-04-08  187  	switch (a->type) {
cb84aa9b42b506 Eric Paris         2010-04-27  188  	case LSM_AUDIT_DATA_NON=
E:
2bf49690325b62 Thomas Liu         2009-07-14  189  		return;
6e837fb152410e Etienne Basset     2009-04-08  190  	case LSM_AUDIT_DATA_IPC:
8e71168e2cc760 Ondrej Mosnacek    2021-09-14  191  		audit_log_format(ab, "=
 ipc_key=3D%d ", a->u.ipc_id);
6e837fb152410e Etienne Basset     2009-04-08  192  		break;
6e837fb152410e Etienne Basset     2009-04-08  193  	case LSM_AUDIT_DATA_CAP:
6e837fb152410e Etienne Basset     2009-04-08  194  		audit_log_format(ab, "=
 capability=3D%d ", a->u.cap);
6e837fb152410e Etienne Basset     2009-04-08  195  		break;
f48b7399840b45 Eric Paris         2011-04-25  196  	case LSM_AUDIT_DATA_PAT=
H: {
f48b7399840b45 Eric Paris         2011-04-25  197  		struct inode *inode;
f48b7399840b45 Eric Paris         2011-04-25  198 =20
f48b7399840b45 Eric Paris         2011-04-25  199  		audit_log_d_path(ab, "=
 path=3D", &a->u.path);
a269434d2fb48a Eric Paris         2011-04-25  200 =20
c6f493d631c4d4 David Howells      2015-03-17  201  		inode =3D d_backing_in=
ode(a->u.path.dentry);
41fdc3054e23e3 Kees Cook          2012-01-07  202  		if (inode) {
41fdc3054e23e3 Kees Cook          2012-01-07  203  			audit_log_format(ab, =
" dev=3D");
41fdc3054e23e3 Kees Cook          2012-01-07  204  			audit_log_untrustedst=
ring(ab, inode->i_sb->s_id);
0b2600f81cefcd Jeff Layton        2026-03-04  205  			audit_log_format(ab, =
" ino=3D%llu", inode->i_ino);
41fdc3054e23e3 Kees Cook          2012-01-07  206  		}
a269434d2fb48a Eric Paris         2011-04-25  207  		break;
6e837fb152410e Etienne Basset     2009-04-08  208  	}
43af5de74288a7 Vivek Goyal        2016-09-09  209  	case LSM_AUDIT_DATA_FIL=
E: {
43af5de74288a7 Vivek Goyal        2016-09-09  210  		struct inode *inode;
43af5de74288a7 Vivek Goyal        2016-09-09  211 =20
43af5de74288a7 Vivek Goyal        2016-09-09  212  		audit_log_d_path(ab, "=
 path=3D", &a->u.file->f_path);
43af5de74288a7 Vivek Goyal        2016-09-09  213 =20
43af5de74288a7 Vivek Goyal        2016-09-09  214  		inode =3D file_inode(a=
->u.file);
43af5de74288a7 Vivek Goyal        2016-09-09  215  		if (inode) {
43af5de74288a7 Vivek Goyal        2016-09-09  216  			audit_log_format(ab, =
" dev=3D");
43af5de74288a7 Vivek Goyal        2016-09-09  217  			audit_log_untrustedst=
ring(ab, inode->i_sb->s_id);
0b2600f81cefcd Jeff Layton        2026-03-04  218  			audit_log_format(ab, =
" ino=3D%llu", inode->i_ino);
43af5de74288a7 Vivek Goyal        2016-09-09  219  		}
43af5de74288a7 Vivek Goyal        2016-09-09  220  		break;
43af5de74288a7 Vivek Goyal        2016-09-09  221  	}
671a2781ff01ab Jeff Vander Stoep  2015-07-10  222  	case LSM_AUDIT_DATA_IOC=
TL_OP: {
671a2781ff01ab Jeff Vander Stoep  2015-07-10  223  		struct inode *inode;
671a2781ff01ab Jeff Vander Stoep  2015-07-10  224 =20
671a2781ff01ab Jeff Vander Stoep  2015-07-10  225  		audit_log_d_path(ab, "=
 path=3D", &a->u.op->path);
671a2781ff01ab Jeff Vander Stoep  2015-07-10  226 =20
671a2781ff01ab Jeff Vander Stoep  2015-07-10  227  		inode =3D a->u.op->pat=
h.dentry->d_inode;
671a2781ff01ab Jeff Vander Stoep  2015-07-10  228  		if (inode) {
671a2781ff01ab Jeff Vander Stoep  2015-07-10  229  			audit_log_format(ab, =
" dev=3D");
671a2781ff01ab Jeff Vander Stoep  2015-07-10  230  			audit_log_untrustedst=
ring(ab, inode->i_sb->s_id);
0b2600f81cefcd Jeff Layton        2026-03-04  231  			audit_log_format(ab, =
" ino=3D%llu", inode->i_ino);
671a2781ff01ab Jeff Vander Stoep  2015-07-10  232  		}
671a2781ff01ab Jeff Vander Stoep  2015-07-10  233 =20
8b31f456c72e53 William Roberts    2016-08-08  234  		audit_log_format(ab, "=
 ioctlcmd=3D0x%hx", a->u.op->cmd);
671a2781ff01ab Jeff Vander Stoep  2015-07-10  235  		break;
671a2781ff01ab Jeff Vander Stoep  2015-07-10  236  	}
a269434d2fb48a Eric Paris         2011-04-25  237  	case LSM_AUDIT_DATA_DEN=
TRY: {
a269434d2fb48a Eric Paris         2011-04-25  238  		struct inode *inode;
a269434d2fb48a Eric Paris         2011-04-25  239 =20
a269434d2fb48a Eric Paris         2011-04-25  240  		audit_log_format(ab, "=
 name=3D");
d36a1dd9f77ae1 Al Viro            2021-01-05  241  		spin_lock(&a->u.dentry=
->d_lock);
a269434d2fb48a Eric Paris         2011-04-25  242  		audit_log_untrustedstr=
ing(ab, a->u.dentry->d_name.name);
d36a1dd9f77ae1 Al Viro            2021-01-05  243  		spin_unlock(&a->u.dent=
ry->d_lock);
a269434d2fb48a Eric Paris         2011-04-25  244 =20
c6f493d631c4d4 David Howells      2015-03-17  245  		inode =3D d_backing_in=
ode(a->u.dentry);
41fdc3054e23e3 Kees Cook          2012-01-07  246  		if (inode) {
41fdc3054e23e3 Kees Cook          2012-01-07  247  			audit_log_format(ab, =
" dev=3D");
41fdc3054e23e3 Kees Cook          2012-01-07  248  			audit_log_untrustedst=
ring(ab, inode->i_sb->s_id);
0b2600f81cefcd Jeff Layton        2026-03-04  249  			audit_log_format(ab, =
" ino=3D%llu", inode->i_ino);
41fdc3054e23e3 Kees Cook          2012-01-07  250  		}
f48b7399840b45 Eric Paris         2011-04-25  251  		break;
f48b7399840b45 Eric Paris         2011-04-25  252  	}
f48b7399840b45 Eric Paris         2011-04-25  253  	case LSM_AUDIT_DATA_INO=
DE: {
6e837fb152410e Etienne Basset     2009-04-08  254  		struct dentry *dentry;
f48b7399840b45 Eric Paris         2011-04-25  255  		struct inode *inode;
f48b7399840b45 Eric Paris         2011-04-25  256 =20
23d8f5b684fc30 Al Viro            2021-01-05  257  		rcu_read_lock();
f48b7399840b45 Eric Paris         2011-04-25  258  		inode =3D a->u.inode;
23d8f5b684fc30 Al Viro            2021-01-05  259  		dentry =3D d_find_alia=
s_rcu(inode);
6e837fb152410e Etienne Basset     2009-04-08  260  		if (dentry) {
6e837fb152410e Etienne Basset     2009-04-08  261  			audit_log_format(ab, =
" name=3D");
d36a1dd9f77ae1 Al Viro            2021-01-05  262  			spin_lock(&dentry->d_=
lock);
d36a1dd9f77ae1 Al Viro            2021-01-05  263  			audit_log_untrustedst=
ring(ab, dentry->d_name.name);
d36a1dd9f77ae1 Al Viro            2021-01-05  264  			spin_unlock(&dentry->=
d_lock);
6e837fb152410e Etienne Basset     2009-04-08  265  		}
41fdc3054e23e3 Kees Cook          2012-01-07  266  		audit_log_format(ab, "=
 dev=3D");
41fdc3054e23e3 Kees Cook          2012-01-07  267  		audit_log_untrustedstr=
ing(ab, inode->i_sb->s_id);
0b2600f81cefcd Jeff Layton        2026-03-04  268  		audit_log_format(ab, "=
 ino=3D%llu", inode->i_ino);
23d8f5b684fc30 Al Viro            2021-01-05  269  		rcu_read_unlock();
6e837fb152410e Etienne Basset     2009-04-08  270  		break;
f48b7399840b45 Eric Paris         2011-04-25  271  	}
5deeb5cece3f9b Richard Guy Briggs 2015-04-14  272  	case LSM_AUDIT_DATA_TAS=
K: {
5deeb5cece3f9b Richard Guy Briggs 2015-04-14  273  		struct task_struct *ts=
k =3D a->u.tsk;
f1dc4867ff41b7 Richard Guy Briggs 2013-12-11  274  		if (tsk) {
fa2bea2f5cca5b Paul Moore         2016-08-30  275  			pid_t pid =3D task_tg=
id_nr(tsk);
f1dc4867ff41b7 Richard Guy Briggs 2013-12-11  276  			if (pid) {
b00083aed484a2 Christian G=C3=B6ttsche 2024-11-25  277  				char tskcomm[si=
zeof(tsk->comm)];
5c5bc97e2fc819 Richard Guy Briggs 2015-04-15  278  				audit_log_format(ab,=
 " opid=3D%d ocomm=3D", pid);
5deeb5cece3f9b Richard Guy Briggs 2015-04-14  279  				audit_log_untrusteds=
tring(ab,
b00083aed484a2 Christian G=C3=B6ttsche 2024-11-25  280  				    get_task_co=
mm(tskcomm, tsk));
6e837fb152410e Etienne Basset     2009-04-08  281  			}
f1dc4867ff41b7 Richard Guy Briggs 2013-12-11  282  		}
6e837fb152410e Etienne Basset     2009-04-08  283  		break;
5deeb5cece3f9b Richard Guy Briggs 2015-04-14  284  	}
6e837fb152410e Etienne Basset     2009-04-08  285  	case LSM_AUDIT_DATA_NET:
48c62af68a403e Eric Paris         2012-04-02  286  		if (a->u.net->sk) {
41dd9596d6b239 Florian Westphal   2020-11-30  287  			const struct sock *sk=
 =3D a->u.net->sk;
b064ba9c3cfaf3 Eric Dumazet       2023-03-17  288  			const struct unix_soc=
k *u;
ae3b564179bfd0 Al Viro            2019-02-15  289  			struct unix_address *=
addr;
6e837fb152410e Etienne Basset     2009-04-08  290  			int len =3D 0;
6e837fb152410e Etienne Basset     2009-04-08  291  			char *p =3D NULL;
6e837fb152410e Etienne Basset     2009-04-08  292 =20
6e837fb152410e Etienne Basset     2009-04-08  293  			switch (sk->sk_family=
) {
6e837fb152410e Etienne Basset     2009-04-08  294  			case AF_INET: {
abc17a11ed29b0 Eric Dumazet       2023-03-16  295  				const struct inet_so=
ck *inet =3D inet_sk(sk);
6e837fb152410e Etienne Basset     2009-04-08  296 =20
c720c7e8383aff Eric Dumazet       2009-10-15  297  				print_ipv4_addr(ab, =
inet->inet_rcv_saddr,
c720c7e8383aff Eric Dumazet       2009-10-15  298  						inet->inet_sport,
6e837fb152410e Etienne Basset     2009-04-08  299  						"laddr", "lport");
c720c7e8383aff Eric Dumazet       2009-10-15  300  				print_ipv4_addr(ab, =
inet->inet_daddr,
c720c7e8383aff Eric Dumazet       2009-10-15  301  						inet->inet_dport,
6e837fb152410e Etienne Basset     2009-04-08  302  						"faddr", "fport");
6e837fb152410e Etienne Basset     2009-04-08  303  				break;
6e837fb152410e Etienne Basset     2009-04-08  304  			}
c2bb06db59eaf9 Eric Dumazet       2013-10-09  305  #if IS_ENABLED(CONFIG_IP=
V6)
6e837fb152410e Etienne Basset     2009-04-08  306  			case AF_INET6: {
abc17a11ed29b0 Eric Dumazet       2023-03-16  307  				const struct inet_so=
ck *inet =3D inet_sk(sk);
6e837fb152410e Etienne Basset     2009-04-08  308 =20
efe4208f47f907 Eric Dumazet       2013-10-03  309  				print_ipv6_addr(ab, =
&sk->sk_v6_rcv_saddr,
c720c7e8383aff Eric Dumazet       2009-10-15  310  						inet->inet_sport,
6e837fb152410e Etienne Basset     2009-04-08  311  						"laddr", "lport");
efe4208f47f907 Eric Dumazet       2013-10-03  312  				print_ipv6_addr(ab, =
&sk->sk_v6_daddr,
c720c7e8383aff Eric Dumazet       2009-10-15  313  						inet->inet_dport,
6e837fb152410e Etienne Basset     2009-04-08  314  						"faddr", "fport");
6e837fb152410e Etienne Basset     2009-04-08  315  				break;
6e837fb152410e Etienne Basset     2009-04-08  316  			}
c2bb06db59eaf9 Eric Dumazet       2013-10-09  317  #endif
6e837fb152410e Etienne Basset     2009-04-08  318  			case AF_UNIX:
6e837fb152410e Etienne Basset     2009-04-08  319  				u =3D unix_sk(sk);
ae3b564179bfd0 Al Viro            2019-02-15  320  				addr =3D smp_load_ac=
quire(&u->addr);
ae3b564179bfd0 Al Viro            2019-02-15  321  				if (!addr)
ae3b564179bfd0 Al Viro            2019-02-15  322  					break;
40ffe67d2e89c7 Al Viro            2012-03-14  323  				if (u->path.dentry) {
40ffe67d2e89c7 Al Viro            2012-03-14  324  					audit_log_d_path(ab=
, " path=3D", &u->path);
6e837fb152410e Etienne Basset     2009-04-08  325  					break;
6e837fb152410e Etienne Basset     2009-04-08  326  				}
ae3b564179bfd0 Al Viro            2019-02-15  327  				len =3D addr->len-si=
zeof(short);
ae3b564179bfd0 Al Viro            2019-02-15  328  				p =3D &addr->name->s=
un_path[0];
6e837fb152410e Etienne Basset     2009-04-08  329  				audit_log_format(ab,=
 " path=3D");
6e837fb152410e Etienne Basset     2009-04-08  330  				if (*p)
6e837fb152410e Etienne Basset     2009-04-08  331  					audit_log_untrusted=
string(ab, p);
6e837fb152410e Etienne Basset     2009-04-08  332  				else
6e837fb152410e Etienne Basset     2009-04-08  333  					audit_log_n_hex(ab,=
 p, len);
6e837fb152410e Etienne Basset     2009-04-08  334  				break;
6e837fb152410e Etienne Basset     2009-04-08  335  			}
6e837fb152410e Etienne Basset     2009-04-08  336  		}
6e837fb152410e Etienne Basset     2009-04-08  337 =20
48c62af68a403e Eric Paris         2012-04-02  338  		switch (a->u.net->fami=
ly) {
6e837fb152410e Etienne Basset     2009-04-08  339  		case AF_INET:
48c62af68a403e Eric Paris         2012-04-02  340  			print_ipv4_addr(ab, a=
->u.net->v4info.saddr,
48c62af68a403e Eric Paris         2012-04-02  341  					a->u.net->sport,
6e837fb152410e Etienne Basset     2009-04-08  342  					"saddr", "src");
48c62af68a403e Eric Paris         2012-04-02  343  			print_ipv4_addr(ab, a=
->u.net->v4info.daddr,
48c62af68a403e Eric Paris         2012-04-02  344  					a->u.net->dport,
6e837fb152410e Etienne Basset     2009-04-08  345  					"daddr", "dest");
6e837fb152410e Etienne Basset     2009-04-08  346  			break;
6e837fb152410e Etienne Basset     2009-04-08  347  		case AF_INET6:
48c62af68a403e Eric Paris         2012-04-02  348  			print_ipv6_addr(ab, &=
a->u.net->v6info.saddr,
48c62af68a403e Eric Paris         2012-04-02  349  					a->u.net->sport,
6e837fb152410e Etienne Basset     2009-04-08  350  					"saddr", "src");
48c62af68a403e Eric Paris         2012-04-02  351  			print_ipv6_addr(ab, &=
a->u.net->v6info.daddr,
48c62af68a403e Eric Paris         2012-04-02  352  					a->u.net->dport,
6e837fb152410e Etienne Basset     2009-04-08  353  					"daddr", "dest");
6e837fb152410e Etienne Basset     2009-04-08  354  			break;
6e837fb152410e Etienne Basset     2009-04-08  355  		}
48c62af68a403e Eric Paris         2012-04-02  356  		if (a->u.net->netif > =
0) {
6e837fb152410e Etienne Basset     2009-04-08  357  			struct net_device *de=
v;
6e837fb152410e Etienne Basset     2009-04-08  358 =20
6e837fb152410e Etienne Basset     2009-04-08  359  			/* NOTE: we always us=
e init's namespace */
48c62af68a403e Eric Paris         2012-04-02  360  			dev =3D dev_get_by_in=
dex(&init_net, a->u.net->netif);
6e837fb152410e Etienne Basset     2009-04-08  361  			if (dev) {
6e837fb152410e Etienne Basset     2009-04-08  362  				audit_log_format(ab,=
 " netif=3D%s", dev->name);
6e837fb152410e Etienne Basset     2009-04-08  363  				dev_put(dev);
6e837fb152410e Etienne Basset     2009-04-08  364  			}
6e837fb152410e Etienne Basset     2009-04-08  365  		}
6e837fb152410e Etienne Basset     2009-04-08  366  		break;
6e837fb152410e Etienne Basset     2009-04-08  367  #ifdef CONFIG_KEYS
6e837fb152410e Etienne Basset     2009-04-08  368  	case LSM_AUDIT_DATA_KEY:
6e837fb152410e Etienne Basset     2009-04-08  369  		audit_log_format(ab, "=
 key_serial=3D%u", a->u.key_struct.key);
6e837fb152410e Etienne Basset     2009-04-08  370  		if (a->u.key_struct.ke=
y_desc) {
6e837fb152410e Etienne Basset     2009-04-08  371  			audit_log_format(ab, =
" key_desc=3D");
6e837fb152410e Etienne Basset     2009-04-08  372  			audit_log_untrustedst=
ring(ab, a->u.key_struct.key_desc);
6e837fb152410e Etienne Basset     2009-04-08  373  		}
6e837fb152410e Etienne Basset     2009-04-08  374  		break;
6e837fb152410e Etienne Basset     2009-04-08  375  #endif
dd8dbf2e6880e3 Eric Paris         2009-11-03  376  	case LSM_AUDIT_DATA_KMO=
D:
dd8dbf2e6880e3 Eric Paris         2009-11-03  377  		audit_log_format(ab, "=
 kmod=3D");
dd8dbf2e6880e3 Eric Paris         2009-11-03  378  		audit_log_untrustedstr=
ing(ab, a->u.kmod_name);
dd8dbf2e6880e3 Eric Paris         2009-11-03  379  		break;
cfc4d882d41780 Daniel Jurgens     2017-05-19  380  	case LSM_AUDIT_DATA_IBP=
KEY: {
cfc4d882d41780 Daniel Jurgens     2017-05-19  381  		struct in6_addr sbn_pf=
x;
cfc4d882d41780 Daniel Jurgens     2017-05-19  382 =20
cfc4d882d41780 Daniel Jurgens     2017-05-19  383  		memset(&sbn_pfx.s6_add=
r, 0,
cfc4d882d41780 Daniel Jurgens     2017-05-19  384  		       sizeof(sbn_pfx.=
s6_addr));
cfc4d882d41780 Daniel Jurgens     2017-05-19  385  		memcpy(&sbn_pfx.s6_add=
r, &a->u.ibpkey->subnet_prefix,
cfc4d882d41780 Daniel Jurgens     2017-05-19  386  		       sizeof(a->u.ibp=
key->subnet_prefix));
cfc4d882d41780 Daniel Jurgens     2017-05-19  387  		audit_log_format(ab, "=
 pkey=3D0x%x subnet_prefix=3D%pI6c",
cfc4d882d41780 Daniel Jurgens     2017-05-19  388  				 a->u.ibpkey->pkey, =
&sbn_pfx);
cfc4d882d41780 Daniel Jurgens     2017-05-19  389  		break;
cfc4d882d41780 Daniel Jurgens     2017-05-19  390  	}
ab861dfca1652a Daniel Jurgens     2017-05-19  391  	case LSM_AUDIT_DATA_IBE=
NDPORT:
ab861dfca1652a Daniel Jurgens     2017-05-19  392  		audit_log_format(ab, "=
 device=3D%s port_num=3D%u",
ab861dfca1652a Daniel Jurgens     2017-05-19  393  				 a->u.ibendport->dev=
_name,
ab861dfca1652a Daniel Jurgens     2017-05-19  394  				 a->u.ibendport->por=
t);
ab861dfca1652a Daniel Jurgens     2017-05-19  395  		break;
59438b46471ae6 Stephen Smalley    2019-11-27  396  	case LSM_AUDIT_DATA_LOC=
KDOWN:
f1d9b23cabc61e Richard Guy Briggs 2020-07-13  397  		audit_log_format(ab, "=
 lockdown_reason=3D\"%s\"",
f1d9b23cabc61e Richard Guy Briggs 2020-07-13  398  				 lockdown_reasons[a-=
>u.reason]);
59438b46471ae6 Stephen Smalley    2019-11-27  399  		break;
c29722fad4aabb Christian G=C3=B6ttsche 2022-03-08  400  	case LSM_AUDIT_DAT=
A_ANONINODE:
c29722fad4aabb Christian G=C3=B6ttsche 2022-03-08  401  		audit_log_format(=
ab, " anonclass=3D%s", a->u.anonclass);
c29722fad4aabb Christian G=C3=B6ttsche 2022-03-08  402  		break;
2ef6fc99e0d922 Thi=C3=A9baud Weksteen  2024-12-05  403  	case LSM_AUDIT_DAT=
A_NLMSGTYPE:
2ef6fc99e0d922 Thi=C3=A9baud Weksteen  2024-12-05  404  		audit_log_format(=
ab, " nl-msgtype=3D%hu", a->u.nlmsg_type);
2ef6fc99e0d922 Thi=C3=A9baud Weksteen  2024-12-05  405  		break;
1f2f7a1fd1fc34 Micka=C3=ABl Sala=C3=BCn     2026-07-26  406  	case LSM_AUDI=
T_DATA_NS:
1f2f7a1fd1fc34 Micka=C3=ABl Sala=C3=BCn     2026-07-26  407  		audit_log_fo=
rmat(ab, " namespace_type=3D0x%x namespace_id=3D%llu",
1f2f7a1fd1fc34 Micka=C3=ABl Sala=C3=BCn     2026-07-26  408  				 a->u.ns.n=
s_type, a->u.ns.ns_id);
1f2f7a1fd1fc34 Micka=C3=ABl Sala=C3=BCn     2026-07-26  409  		break;
6e837fb152410e Etienne Basset     2009-04-08  410  	} /* switch (a->type) */
6e837fb152410e Etienne Basset     2009-04-08  411  }
6e837fb152410e Etienne Basset     2009-04-08  412 =20

:::::: The code at line 185 was first introduced by commit
:::::: 07f62eb66c6626aa5653a0fcb34c9c040d0bd032 LSM: BUILD_BUG_ON if the co=
mmon_audit_data union ever grows

:::::: TO: Eric Paris <eparis@redhat.com>
:::::: CC: Eric Paris <eparis@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA65349AF4
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766157644; cv=none; b=Rnp/t4a9Q3HDVH3nCgZROO7IrxRgkunUvUNUa0wx46P0hmYZor1TDzmB3tRAIwCLpRiHaG2m3Px844OkGnUhZwcvGk0MEzz/st/Q/lV7ngJ11yTAt8OmV3c3k9NkmKEIbvNXoZcQt8ONlwY4Socc7vOOKF5mTmGuDWzVtDEJdsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766157644; c=relaxed/simple;
	bh=Mkifq/IrXLlBqSr9JsZv/xqzcwk322WsnJF4SjLnoM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o5Um8t7DbBnv305kYoTczM2r4/QUVAbjKnTcCORLQ/nsaXG5andJch7K3ry/GPR3LYW5+WwEBtxUlCzE8zix4OPOCvTOges4NgMzBSbU3q157zd00mro+mve08uxr0IIJvT2TW+Fpgk2sld+WO1tewy3+QbVz5uidRn6YimN4dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Imgmp05h; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Imgmp05h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766157642; x=1797693642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mkifq/IrXLlBqSr9JsZv/xqzcwk322WsnJF4SjLnoM0=;
  b=Imgmp05hN30FE4vT22WEusZNwDMAkrHgxfjX1OomlTEgyxfYEUQVp/u3
   /znytsVho6zB6Gsvssy0hIedJzI2utEFKOkU12sNZem2JnIiMbYY9xQ0D
   HdgB6dhfEXaAc6ekvYTJbwtJkv9AZOh4it5e4CPLm5EsO4NQPlSPC0wgG
   y4Yi3sHBLg8j2Hb1GeZCPTAO9EcIk/Mb2TzVsc0yscfrsUm8FJZI9krrr
   xacgRrkZd/Bi4oeSOE9R6XGu1PgaqN0sAqFMymFWfLniy0+DOmJBbYiLS
   KG328XG7F9S27ectKA8zjDhcu+BTkwhtnKaoTxD/BplxdHnHYj8+dX3E9
   w==;
X-CSE-ConnectionGUID: nOFjQFehRd2VKj1trRnHFA==
X-CSE-MsgGUID: rALtcxBsR3K+cH1LeptV6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="79487857"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="79487857"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 07:20:41 -0800
X-CSE-ConnectionGUID: i6G4UYZ8TJO4eFeszRaejQ==
X-CSE-MsgGUID: vpStdRdtSvWMg9VxDDPYUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="203797811"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Dec 2025 07:20:40 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWcHV-000000003fV-2C5S;
	Fri, 19 Dec 2025 15:20:37 +0000
Date: Fri, 19 Dec 2025 23:20:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 43/43]
 fs/smb/client/connect.c:2758 cifs_match_super() error: 'tlink' dereferencing
 possible ERR_PTR()
Message-ID: <202512192316.Z5y1Q4sz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [43/43] smb: move client and server files to common directory fs/smb
:::::: branch date: 29 hours ago
:::::: commit date: 2 years, 6 months ago
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251219/202512192316.Z5y1Q4sz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512192316.Z5y1Q4sz-lkp@intel.com/

New smatch warnings:
fs/smb/client/connect.c:2758 cifs_match_super() error: 'tlink' dereferencing possible ERR_PTR()
fs/smb/client/connect.c:2957 generic_ip_connect() error: we previously assumed 'socket' could be null (see line 2945)
fs/smb/client/smb2ops.c:4984 receive_encrypted_read() error: we previously assumed 'pages' could be null (see line 4912)
fs/smb/client/cifssmb.c:4026 CIFSFindFirst() warn: missing error code? 'rc'
fs/smb/client/cifssmb.c:4153 CIFSFindNext() warn: missing error code? 'rc'

Old smatch warnings:
fs/smb/client/smb2ops.c:2054 smb3_enum_snapshots() warn: potential user controlled sizeof overflow 'snapshot_in.snapshot_array_size + 12' '0-u32max + 12'
fs/smb/client/smb2ops.c:2056 smb3_enum_snapshots() warn: potential user controlled sizeof overflow 'snapshot_in.snapshot_array_size + 12' '0-u32max + 12'

vim +/tlink +2758 fs/smb/client/connect.c

c1d8b24d1819276 fs/cifs/connect.c Sachin Prabhu          2016-07-29  2730  
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2731  int
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2732  cifs_match_super(struct super_block *sb, void *data)
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2733  {
0f46608ae7a138a fs/cifs/connect.c Yu Zhe                 2022-06-30  2734  	struct cifs_mnt_data *mnt_data = data;
3fa1c6d1b8f5c3d fs/cifs/connect.c Ronnie Sahlberg        2020-12-09  2735  	struct smb3_fs_context *ctx;
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2736  	struct cifs_sb_info *cifs_sb;
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2737  	struct TCP_Server_Info *tcp_srv;
96daf2b09178d8e fs/cifs/connect.c Steve French           2011-05-27  2738  	struct cifs_ses *ses;
96daf2b09178d8e fs/cifs/connect.c Steve French           2011-05-27  2739  	struct cifs_tcon *tcon;
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2740  	struct tcon_link *tlink;
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2741  	int rc = 0;
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2742  
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2743  	spin_lock(&cifs_tcp_ses_lock);
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2744  	cifs_sb = CIFS_SB(sb);
bb0091a5c97ab66 fs/cifs/connect.c Steve French           2023-05-09  2745  
bb0091a5c97ab66 fs/cifs/connect.c Steve French           2023-05-09  2746  	/* We do not want to use a superblock that has been shutdown */
bb0091a5c97ab66 fs/cifs/connect.c Steve French           2023-05-09  2747  	if (CIFS_MOUNT_SHUTDOWN & cifs_sb->mnt_cifs_flags) {
bb0091a5c97ab66 fs/cifs/connect.c Steve French           2023-05-09  2748  		spin_unlock(&cifs_tcp_ses_lock);
bb0091a5c97ab66 fs/cifs/connect.c Steve French           2023-05-09  2749  		return 0;
bb0091a5c97ab66 fs/cifs/connect.c Steve French           2023-05-09  2750  	}
bb0091a5c97ab66 fs/cifs/connect.c Steve French           2023-05-09  2751  
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2752  	tlink = cifs_get_tlink(cifs_sb_master_tlink(cifs_sb));
9ed38fd4a15417c fs/cifs/connect.c Steve French           2021-09-23  2753  	if (tlink == NULL) {
9ed38fd4a15417c fs/cifs/connect.c Steve French           2021-09-23  2754  		/* can not match superblock if tlink were ever null */
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2755  		spin_unlock(&cifs_tcp_ses_lock);
9ed38fd4a15417c fs/cifs/connect.c Steve French           2021-09-23  2756  		return 0;
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2757  	}
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26 @2758  	tcon = tlink_tcon(tlink);
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2759  	ses = tcon->ses;
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2760  	tcp_srv = ses->server;
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2761  
3fa1c6d1b8f5c3d fs/cifs/connect.c Ronnie Sahlberg        2020-12-09  2762  	ctx = mnt_data->ctx;
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2763  
d7d7a66aacd6fd8 fs/cifs/connect.c Shyam Prasad N         2022-07-27  2764  	spin_lock(&tcp_srv->srv_lock);
d7d7a66aacd6fd8 fs/cifs/connect.c Shyam Prasad N         2022-07-27  2765  	spin_lock(&ses->ses_lock);
f11f6ea883de3ee fs/cifs/connect.c Shyam Prasad N         2023-02-20  2766  	spin_lock(&ses->chan_lock);
d7d7a66aacd6fd8 fs/cifs/connect.c Shyam Prasad N         2022-07-27  2767  	spin_lock(&tcon->tc_lock);
3fa1c6d1b8f5c3d fs/cifs/connect.c Ronnie Sahlberg        2020-12-09  2768  	if (!match_server(tcp_srv, ctx) ||
3fa1c6d1b8f5c3d fs/cifs/connect.c Ronnie Sahlberg        2020-12-09  2769  	    !match_session(ses, ctx) ||
3fa1c6d1b8f5c3d fs/cifs/connect.c Ronnie Sahlberg        2020-12-09  2770  	    !match_tcon(tcon, ctx) ||
c1d8b24d1819276 fs/cifs/connect.c Sachin Prabhu          2016-07-29  2771  	    !match_prepath(sb, mnt_data)) {
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2772  		rc = 0;
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2773  		goto out;
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2774  	}
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2775  
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2776  	rc = compare_mount_options(sb, mnt_data);
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2777  out:
d7d7a66aacd6fd8 fs/cifs/connect.c Shyam Prasad N         2022-07-27  2778  	spin_unlock(&tcon->tc_lock);
f11f6ea883de3ee fs/cifs/connect.c Shyam Prasad N         2023-02-20  2779  	spin_unlock(&ses->chan_lock);
d7d7a66aacd6fd8 fs/cifs/connect.c Shyam Prasad N         2022-07-27  2780  	spin_unlock(&ses->ses_lock);
d7d7a66aacd6fd8 fs/cifs/connect.c Shyam Prasad N         2022-07-27  2781  	spin_unlock(&tcp_srv->srv_lock);
d7d7a66aacd6fd8 fs/cifs/connect.c Shyam Prasad N         2022-07-27  2782  
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2783  	spin_unlock(&cifs_tcp_ses_lock);
f484b5d001a972a fs/cifs/connect.c Jeff Layton            2011-07-11  2784  	cifs_put_tlink(tlink);
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2785  	return rc;
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2786  }
25c7f41e9234f60 fs/cifs/connect.c Pavel Shilovsky        2011-05-26  2787  
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2788  #ifdef CONFIG_DEBUG_LOCK_ALLOC
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2789  static struct lock_class_key cifs_key[2];
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2790  static struct lock_class_key cifs_slock_key[2];
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2791  
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2792  static inline void
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2793  cifs_reclassify_socket4(struct socket *sock)
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2794  {
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2795  	struct sock *sk = sock->sk;
fafc4e1ea1a4c1e fs/cifs/connect.c Hannes Frederic Sowa   2016-04-08  2796  	BUG_ON(!sock_allow_reclassification(sk));
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2797  	sock_lock_init_class_and_name(sk, "slock-AF_INET-CIFS",
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2798  		&cifs_slock_key[0], "sk_lock-AF_INET-CIFS", &cifs_key[0]);
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2799  }
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2800  
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2801  static inline void
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2802  cifs_reclassify_socket6(struct socket *sock)
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2803  {
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2804  	struct sock *sk = sock->sk;
fafc4e1ea1a4c1e fs/cifs/connect.c Hannes Frederic Sowa   2016-04-08  2805  	BUG_ON(!sock_allow_reclassification(sk));
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2806  	sock_lock_init_class_and_name(sk, "slock-AF_INET6-CIFS",
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2807  		&cifs_slock_key[1], "sk_lock-AF_INET6-CIFS", &cifs_key[1]);
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2808  }
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2809  #else
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2810  static inline void
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2811  cifs_reclassify_socket4(struct socket *sock)
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2812  {
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2813  }
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2814  
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2815  static inline void
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2816  cifs_reclassify_socket6(struct socket *sock)
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2817  {
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2818  }
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2819  #endif
09e50d55a9490e9 fs/cifs/connect.c Jeff Layton            2008-07-23  2820  
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2821  /* See RFC1001 section 14 on representation of Netbios names */
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2822  static void rfc1002mangle(char *target, char *source, unsigned int length)
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2823  {
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2824  	unsigned int i, j;
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2825  
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2826  	for (i = 0, j = 0; i < (length); i++) {
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2827  		/* mask a nibble at a time and encode */
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2828  		target[j] = 'A' + (0x0F & (source[i] >> 4));
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2829  		target[j+1] = 'A' + (0x0F & source[i]);
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2830  		j += 2;
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2831  	}
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2832  
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2833  }
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2834  
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2835  static int
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2836  bind_socket(struct TCP_Server_Info *server)
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2837  {
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2838  	int rc = 0;
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2839  	if (server->srcaddr.ss_family != AF_UNSPEC) {
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2840  		/* Bind to the specified local IP address */
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2841  		struct socket *socket = server->ssocket;
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2842  		rc = socket->ops->bind(socket,
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2843  				       (struct sockaddr *) &server->srcaddr,
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2844  				       sizeof(server->srcaddr));
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2845  		if (rc < 0) {
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2846  			struct sockaddr_in *saddr4;
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2847  			struct sockaddr_in6 *saddr6;
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2848  			saddr4 = (struct sockaddr_in *)&server->srcaddr;
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2849  			saddr6 = (struct sockaddr_in6 *)&server->srcaddr;
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2850  			if (saddr6->sin6_family == AF_INET6)
afe6f65353b644f fs/cifs/connect.c Ronnie Sahlberg        2019-08-28  2851  				cifs_server_dbg(VFS, "Failed to bind to: %pI6c, error: %d\n",
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2852  					 &saddr6->sin6_addr, rc);
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2853  			else
afe6f65353b644f fs/cifs/connect.c Ronnie Sahlberg        2019-08-28  2854  				cifs_server_dbg(VFS, "Failed to bind to: %pI4, error: %d\n",
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2855  					 &saddr4->sin_addr.s_addr, rc);
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2856  		}
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2857  	}
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2858  	return rc;
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2859  }
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2860  
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2861  static int
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2862  ip_rfc1001_connect(struct TCP_Server_Info *server)
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2863  {
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2864  	int rc = 0;
bcf4b1063db246a fs/cifs/connect.c Jeff Layton            2008-12-01  2865  	/*
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2866  	 * some servers require RFC1001 sessinit before sending
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2867  	 * negprot - BB check reconnection in case where second
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2868  	 * sessinit is sent but no second negprot
bcf4b1063db246a fs/cifs/connect.c Jeff Layton            2008-12-01  2869  	 */
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2870  	struct rfc1002_session_packet req = {};
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2871  	struct smb_hdr *smb_buf = (struct smb_hdr *)&req;
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2872  	unsigned int len;
d7173623bf0b150 fs/cifs/connect.c Enzo Matsumiya         2022-10-12  2873  
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2874  	req.trailer.session_req.called_len = sizeof(req.trailer.session_req.called_name);
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2875  
997152f62751b7d fs/cifs/connect.c Colin Ian King         2016-01-25  2876  	if (server->server_RFC1001_name[0] != 0)
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2877  		rfc1002mangle(req.trailer.session_req.called_name,
bcf4b1063db246a fs/cifs/connect.c Jeff Layton            2008-12-01  2878  			      server->server_RFC1001_name,
8ecaf67a8ea58c8 fs/cifs/connect.c Jeff Layton            2008-12-01  2879  			      RFC1001_NAME_LEN_WITH_NULL);
bcf4b1063db246a fs/cifs/connect.c Jeff Layton            2008-12-01  2880  	else
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2881  		rfc1002mangle(req.trailer.session_req.called_name,
8ecaf67a8ea58c8 fs/cifs/connect.c Jeff Layton            2008-12-01  2882  			      DEFAULT_CIFS_CALLED_NAME,
8ecaf67a8ea58c8 fs/cifs/connect.c Jeff Layton            2008-12-01  2883  			      RFC1001_NAME_LEN_WITH_NULL);
a10faeb2a3e2663 fs/cifs/connect.c Steve French           2005-08-22  2884  
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2885  	req.trailer.session_req.calling_len = sizeof(req.trailer.session_req.calling_name);
bcf4b1063db246a fs/cifs/connect.c Jeff Layton            2008-12-01  2886  
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2887  	/* calling name ends in null (byte 16) from old smb convention */
c85c35f8fc1d3f5 fs/cifs/connect.c Steve French           2015-03-27  2888  	if (server->workstation_RFC1001_name[0] != 0)
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2889  		rfc1002mangle(req.trailer.session_req.calling_name,
bcf4b1063db246a fs/cifs/connect.c Jeff Layton            2008-12-01  2890  			      server->workstation_RFC1001_name,
8ecaf67a8ea58c8 fs/cifs/connect.c Jeff Layton            2008-12-01  2891  			      RFC1001_NAME_LEN_WITH_NULL);
bcf4b1063db246a fs/cifs/connect.c Jeff Layton            2008-12-01  2892  	else
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2893  		rfc1002mangle(req.trailer.session_req.calling_name,
8ecaf67a8ea58c8 fs/cifs/connect.c Jeff Layton            2008-12-01  2894  			      "LINUX_CIFS_CLNT",
8ecaf67a8ea58c8 fs/cifs/connect.c Jeff Layton            2008-12-01  2895  			      RFC1001_NAME_LEN_WITH_NULL);
bcf4b1063db246a fs/cifs/connect.c Jeff Layton            2008-12-01  2896  
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2897  	/*
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2898  	 * As per rfc1002, @len must be the number of bytes that follows the
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2899  	 * length field of a rfc1002 session request payload.
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2900  	 */
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2901  	len = sizeof(req) - offsetof(struct rfc1002_session_packet, trailer.session_req);
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2902  
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2903  	smb_buf->smb_buf_length = cpu_to_be32((RFC1002_SESSION_REQUEST << 24) | len);
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2904  	rc = smb_send(server, smb_buf, len);
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2905  	/*
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2906  	 * RFC1001 layer in at least one server requires very short break before
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2907  	 * negprot presumably because not expecting negprot to follow so fast.
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2908  	 * This is a simple solution that works without complicating the code
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2909  	 * and causes no significant slowing down on mount for everyone else
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2910  	 */
e49a6d569d7c4d4 fs/cifs/connect.c Paulo Alcantara        2023-02-16  2911  	usleep_range(1000, 2000);
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2912  
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2913  	return rc;
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2914  }
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2915  
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2916  static int
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2917  generic_ip_connect(struct TCP_Server_Info *server)
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2918  {
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2919  	int rc = 0;
6da9791061ca3b7 fs/cifs/connect.c Steve French           2011-03-13  2920  	__be16 sport;
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2921  	int slen, sfamily;
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01  2922  	struct socket *socket = server->ssocket;
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2923  	struct sockaddr *saddr;
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2924  
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2925  	saddr = (struct sockaddr *) &server->dstaddr;
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2926  
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2927  	if (server->dstaddr.ss_family == AF_INET6) {
def6e1dc1781682 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2928  		struct sockaddr_in6 *ipv6 = (struct sockaddr_in6 *)&server->dstaddr;
def6e1dc1781682 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2929  
def6e1dc1781682 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2930  		sport = ipv6->sin6_port;
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2931  		slen = sizeof(struct sockaddr_in6);
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2932  		sfamily = AF_INET6;
def6e1dc1781682 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2933  		cifs_dbg(FYI, "%s: connecting to [%pI6]:%d\n", __func__, &ipv6->sin6_addr,
def6e1dc1781682 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2934  				ntohs(sport));
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2935  	} else {
def6e1dc1781682 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2936  		struct sockaddr_in *ipv4 = (struct sockaddr_in *)&server->dstaddr;
def6e1dc1781682 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2937  
def6e1dc1781682 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2938  		sport = ipv4->sin_port;
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2939  		slen = sizeof(struct sockaddr_in);
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2940  		sfamily = AF_INET;
def6e1dc1781682 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2941  		cifs_dbg(FYI, "%s: connecting to %pI4:%d\n", __func__, &ipv4->sin_addr,
def6e1dc1781682 fs/cifs/connect.c Samuel Cabrero         2020-10-16  2942  				ntohs(sport));
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2943  	}
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2944  
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01 @2945  	if (socket == NULL) {
f1d0c998653f1ee fs/cifs/connect.c Rob Landley            2011-01-22  2946  		rc = __sock_create(cifs_net_ns(server), sfamily, SOCK_STREAM,
f1d0c998653f1ee fs/cifs/connect.c Rob Landley            2011-01-22  2947  				   IPPROTO_TCP, &socket, 1);
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2948  		if (rc < 0) {
afe6f65353b644f fs/cifs/connect.c Ronnie Sahlberg        2019-08-28  2949  			cifs_server_dbg(VFS, "Error %d creating socket\n", rc);
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2950  			server->ssocket = NULL;
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2951  			return rc;
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01  2952  		}
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01  2953  
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2954  		/* BB other socket options to set KEEPALIVE, NODELAY? */
f96637be081141d fs/cifs/connect.c Joe Perches            2013-05-04  2955  		cifs_dbg(FYI, "Socket created\n");
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01  2956  		server->ssocket = socket;
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01 @2957  		socket->sk->sk_allocation = GFP_NOFS;
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2958  		if (sfamily == AF_INET6)
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01  2959  			cifs_reclassify_socket6(socket);
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2960  		else
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2961  			cifs_reclassify_socket4(socket);
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2962  	}
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  2963  
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2964  	rc = bind_socket(server);
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2965  	if (rc < 0)
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2966  		return rc;
3eb9a8893a76cf1 fs/cifs/connect.c Ben Greear             2010-09-01  2967  
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01  2968  	/*
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01  2969  	 * Eventually check for other socket options to change from
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01  2970  	 * the default. sock_setsockopt not used because it expects
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01  2971  	 * user space buffer
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01  2972  	 */
d5c5605c27c92da fs/cifs/connect.c Jeff Layton            2008-12-01  2973  	socket->sk->sk_rcvtimeo = 7 * HZ;
da505c386c9f993 fs/cifs/connect.c Steve French           2009-01-19  2974  	socket->sk->sk_sndtimeo = 5 * HZ;
6a5fa2362b628ee fs/cifs/connect.c Steve French           2010-01-01  2975  
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2976  	/* make the bufsizes depend on wsize/rsize and max requests */
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2977  	if (server->noautotune) {
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2978  		if (socket->sk->sk_sndbuf < (200 * 1024))
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2979  			socket->sk->sk_sndbuf = 200 * 1024;
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2980  		if (socket->sk->sk_rcvbuf < (140 * 1024))
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2981  			socket->sk->sk_rcvbuf = 140 * 1024;
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2982  	}
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2983  
12abc5ee7873a08 fs/cifs/connect.c Christoph Hellwig      2020-05-28  2984  	if (server->tcp_nodelay)
12abc5ee7873a08 fs/cifs/connect.c Christoph Hellwig      2020-05-28  2985  		tcp_sock_set_nodelay(socket->sk);
6a5fa2362b628ee fs/cifs/connect.c Steve French           2010-01-01  2986  
f96637be081141d fs/cifs/connect.c Joe Perches            2013-05-04  2987  	cifs_dbg(FYI, "sndbuf %d rcvbuf %d rcvtimeo 0x%lx\n",
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2988  		 socket->sk->sk_sndbuf,
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2989  		 socket->sk->sk_rcvbuf, socket->sk->sk_rcvtimeo);
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  2990  
8eecd1c2e5bc73d fs/cifs/connect.c Paulo Alcantara (SUSE  2019-07-16  2991) 	rc = socket->ops->connect(socket, saddr, slen,
8eecd1c2e5bc73d fs/cifs/connect.c Paulo Alcantara (SUSE  2019-07-16  2992) 				  server->noblockcnt ? O_NONBLOCK : 0);
d532cc7efdfd7bf fs/cifs/connect.c Paulo Alcantara (SUSE  2019-10-10  2993) 	/*
d532cc7efdfd7bf fs/cifs/connect.c Paulo Alcantara (SUSE  2019-10-10  2994) 	 * When mounting SMB root file systems, we do not want to block in
d532cc7efdfd7bf fs/cifs/connect.c Paulo Alcantara (SUSE  2019-10-10  2995) 	 * connect. Otherwise bail out and then let cifs_reconnect() perform
d532cc7efdfd7bf fs/cifs/connect.c Paulo Alcantara (SUSE  2019-10-10  2996) 	 * reconnect failover - if possible.
d532cc7efdfd7bf fs/cifs/connect.c Paulo Alcantara (SUSE  2019-10-10  2997) 	 */
d532cc7efdfd7bf fs/cifs/connect.c Paulo Alcantara (SUSE  2019-10-10  2998) 	if (server->noblockcnt && rc == -EINPROGRESS)
8eecd1c2e5bc73d fs/cifs/connect.c Paulo Alcantara (SUSE  2019-07-16  2999) 		rc = 0;
ee1b3ea9e6171d7 fs/cifs/connect.c Jeff Layton            2011-06-21  3000  	if (rc < 0) {
f96637be081141d fs/cifs/connect.c Joe Perches            2013-05-04  3001  		cifs_dbg(FYI, "Error %d connecting to server\n", rc);
d7171cd1acf70eb fs/cifs/connect.c Steve French           2021-11-04  3002  		trace_smb3_connect_err(server->hostname, server->conn_id, &server->dstaddr, rc);
ee1b3ea9e6171d7 fs/cifs/connect.c Jeff Layton            2011-06-21  3003  		sock_release(socket);
ee1b3ea9e6171d7 fs/cifs/connect.c Jeff Layton            2011-06-21  3004  		server->ssocket = NULL;
ee1b3ea9e6171d7 fs/cifs/connect.c Jeff Layton            2011-06-21  3005  		return rc;
ee1b3ea9e6171d7 fs/cifs/connect.c Jeff Layton            2011-06-21  3006  	}
d7171cd1acf70eb fs/cifs/connect.c Steve French           2021-11-04  3007  	trace_smb3_connect_done(server->hostname, server->conn_id, &server->dstaddr);
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  3008  	if (sport == htons(RFC1001_PORT))
a9f1b85e5ba8051 fs/cifs/connect.c Pavel Shilovsky        2010-12-13  3009  		rc = ip_rfc1001_connect(server);
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  3010  
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  3011  	return rc;
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  3012  }
^1da177e4c3f415 fs/cifs/connect.c Linus Torvalds         2005-04-16  3013  

:::::: The code at line 2758 was first introduced by commit
:::::: 25c7f41e9234f60af30e086278f1de7974f8816f CIFS: Migrate to shared superblock model

:::::: TO: Pavel Shilovsky <piastry@etersoft.ru>
:::::: CC: Steve French <sfrench@us.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

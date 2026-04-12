Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC46013D8B1
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Apr 2026 00:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775953400; cv=none; b=iZNRZg5IeyAYmTnRvum8+iN5Rt7rM6l5MR+QLJXV0pYqvuFCixOYJ845Nht/auw1MfvZcGNA0CJMCaoyaGdA7dU8BzdVfMHcYjcuVoT9yZwfcRUpeBO5pLvVGwUTS52wv8rLdVjrZ0w4/rQPdzz1WIN0SfK99gumQSy36yhZTtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775953400; c=relaxed/simple;
	bh=Fq5kuzzU6tW9Nilu0Ex0g8k2Vm6TlrgB0haP6ta48Pc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZTrzUC/PT4N9G4+uXM9kADOykMbbYXeRkTIwOERxvgUWIVpI3q5YhjH5OZWWZ8b/TqUpcuPMJrxPVYsNqUZFUM9bK+ODTLDAas9MFOlUXcX+h4C4yk9bLDKfKV/OiLbRl4nqdKIcvh3Bap/WXlxJrrqsDCKRq4UkbtYhUjHgiTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcEMNs/I; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcEMNs/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775953397; x=1807489397;
  h=date:from:to:cc:subject:message-id;
  bh=Fq5kuzzU6tW9Nilu0Ex0g8k2Vm6TlrgB0haP6ta48Pc=;
  b=HcEMNs/ILsB8A8ZIrQrhn7BmLu9oFRpYA6w3MUT3rIX35Opcdg7WX/jr
   VudtYoooQD/sIDy4NtDI1WdOBp/UBYqd1O7KQlJ9wu+FM/PNnMdPBY2aw
   ZfxWCR7AX4LtmUnTPG32M/RYX4WsRHgsWueZbZfYhYHaDEiXLsSqeoGcK
   uYe9MXxpvV7mgHtAznG69eZ6A4reP3nfewxusxKjlfV3hf/J4YtTjo73f
   SVnr9jnNYGptydMKb1FCntdWaXiNhTb6/jGl26sx4n+8MtKMEms8pvKjJ
   SnKr9m/i82vxd6kr+zjJJRbTLMaRn5kQTM2sgJ8KjsP4OsDmN36tlhdzh
   Q==;
X-CSE-ConnectionGUID: V1Rkly9YRqOIh0m1JL6vuA==
X-CSE-MsgGUID: ZO2PZlboRV6Rhh4zWq6AGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76819214"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="76819214"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 17:23:17 -0700
X-CSE-ConnectionGUID: /4SHsHXoSjuvimWsbOZFOw==
X-CSE-MsgGUID: 621puVxkTvGUu3YSu78IQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="234423629"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Apr 2026 17:23:16 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBibZ-000000001h3-23KV;
	Sun, 12 Apr 2026 00:23:13 +0000
Date: Sun, 12 Apr 2026 08:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 33/33]
 fs/smb/client/connect.c:2758 cifs_match_super() error: 'tlink' dereferencing
 possible ERR_PTR()
Message-ID: <202604120812.FL0VhS2U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   99dbe982c07d6992eb677164c7e5ae00e329b835
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [33/33] smb: move client and server files to common directory fs/smb
:::::: branch date: 31 hours ago
:::::: commit date: 2 years, 10 months ago
config: i386-randconfig-141-20260408 (https://download.01.org/0day-ci/archive/20260412/202604120812.FL0VhS2U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604120812.FL0VhS2U-lkp@intel.com/

New smatch warnings:
fs/smb/client/connect.c:2758 cifs_match_super() error: 'tlink' dereferencing possible ERR_PTR()

Old smatch warnings:
fs/smb/client/connect.c:2957 generic_ip_connect() error: we previously assumed 'socket' could be null (see line 2945)

vim +/tlink +2758 fs/smb/client/connect.c

c1d8b24d181927 fs/cifs/connect.c Sachin Prabhu   2016-07-29  2730  
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2731  int
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2732  cifs_match_super(struct super_block *sb, void *data)
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2733  {
0f46608ae7a138 fs/cifs/connect.c Yu Zhe          2022-06-30  2734  	struct cifs_mnt_data *mnt_data = data;
3fa1c6d1b8f5c3 fs/cifs/connect.c Ronnie Sahlberg 2020-12-09  2735  	struct smb3_fs_context *ctx;
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2736  	struct cifs_sb_info *cifs_sb;
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2737  	struct TCP_Server_Info *tcp_srv;
96daf2b09178d8 fs/cifs/connect.c Steve French    2011-05-27  2738  	struct cifs_ses *ses;
96daf2b09178d8 fs/cifs/connect.c Steve French    2011-05-27  2739  	struct cifs_tcon *tcon;
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2740  	struct tcon_link *tlink;
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2741  	int rc = 0;
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2742  
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2743  	spin_lock(&cifs_tcp_ses_lock);
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2744  	cifs_sb = CIFS_SB(sb);
bb0091a5c97ab6 fs/cifs/connect.c Steve French    2023-05-09  2745  
bb0091a5c97ab6 fs/cifs/connect.c Steve French    2023-05-09  2746  	/* We do not want to use a superblock that has been shutdown */
bb0091a5c97ab6 fs/cifs/connect.c Steve French    2023-05-09  2747  	if (CIFS_MOUNT_SHUTDOWN & cifs_sb->mnt_cifs_flags) {
bb0091a5c97ab6 fs/cifs/connect.c Steve French    2023-05-09  2748  		spin_unlock(&cifs_tcp_ses_lock);
bb0091a5c97ab6 fs/cifs/connect.c Steve French    2023-05-09  2749  		return 0;
bb0091a5c97ab6 fs/cifs/connect.c Steve French    2023-05-09  2750  	}
bb0091a5c97ab6 fs/cifs/connect.c Steve French    2023-05-09  2751  
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2752  	tlink = cifs_get_tlink(cifs_sb_master_tlink(cifs_sb));
9ed38fd4a15417 fs/cifs/connect.c Steve French    2021-09-23  2753  	if (tlink == NULL) {
9ed38fd4a15417 fs/cifs/connect.c Steve French    2021-09-23  2754  		/* can not match superblock if tlink were ever null */
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2755  		spin_unlock(&cifs_tcp_ses_lock);
9ed38fd4a15417 fs/cifs/connect.c Steve French    2021-09-23  2756  		return 0;
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2757  	}
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26 @2758  	tcon = tlink_tcon(tlink);
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2759  	ses = tcon->ses;
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2760  	tcp_srv = ses->server;
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2761  
3fa1c6d1b8f5c3 fs/cifs/connect.c Ronnie Sahlberg 2020-12-09  2762  	ctx = mnt_data->ctx;
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2763  
d7d7a66aacd6fd fs/cifs/connect.c Shyam Prasad N  2022-07-27  2764  	spin_lock(&tcp_srv->srv_lock);
d7d7a66aacd6fd fs/cifs/connect.c Shyam Prasad N  2022-07-27  2765  	spin_lock(&ses->ses_lock);
f11f6ea883de3e fs/cifs/connect.c Shyam Prasad N  2023-02-20  2766  	spin_lock(&ses->chan_lock);
d7d7a66aacd6fd fs/cifs/connect.c Shyam Prasad N  2022-07-27  2767  	spin_lock(&tcon->tc_lock);
3fa1c6d1b8f5c3 fs/cifs/connect.c Ronnie Sahlberg 2020-12-09  2768  	if (!match_server(tcp_srv, ctx) ||
3fa1c6d1b8f5c3 fs/cifs/connect.c Ronnie Sahlberg 2020-12-09  2769  	    !match_session(ses, ctx) ||
3fa1c6d1b8f5c3 fs/cifs/connect.c Ronnie Sahlberg 2020-12-09  2770  	    !match_tcon(tcon, ctx) ||
c1d8b24d181927 fs/cifs/connect.c Sachin Prabhu   2016-07-29  2771  	    !match_prepath(sb, mnt_data)) {
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2772  		rc = 0;
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2773  		goto out;
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2774  	}
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2775  
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2776  	rc = compare_mount_options(sb, mnt_data);
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2777  out:
d7d7a66aacd6fd fs/cifs/connect.c Shyam Prasad N  2022-07-27  2778  	spin_unlock(&tcon->tc_lock);
f11f6ea883de3e fs/cifs/connect.c Shyam Prasad N  2023-02-20  2779  	spin_unlock(&ses->chan_lock);
d7d7a66aacd6fd fs/cifs/connect.c Shyam Prasad N  2022-07-27  2780  	spin_unlock(&ses->ses_lock);
d7d7a66aacd6fd fs/cifs/connect.c Shyam Prasad N  2022-07-27  2781  	spin_unlock(&tcp_srv->srv_lock);
d7d7a66aacd6fd fs/cifs/connect.c Shyam Prasad N  2022-07-27  2782  
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2783  	spin_unlock(&cifs_tcp_ses_lock);
f484b5d001a972 fs/cifs/connect.c Jeff Layton     2011-07-11  2784  	cifs_put_tlink(tlink);
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2785  	return rc;
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2786  }
25c7f41e9234f6 fs/cifs/connect.c Pavel Shilovsky 2011-05-26  2787  

:::::: The code at line 2758 was first introduced by commit
:::::: 25c7f41e9234f60af30e086278f1de7974f8816f CIFS: Migrate to shared superblock model

:::::: TO: Pavel Shilovsky <piastry@etersoft.ru>
:::::: CC: Steve French <sfrench@us.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

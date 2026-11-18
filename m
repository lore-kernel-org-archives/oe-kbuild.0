Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034081;
	b=zOthCrjPFC0x4SLiLjtw428SUiPVEZf7U0UTKPyx0+F98csHh7iLu/69mLN9n7GRwLr+
	 tuTaGof389VrhR0jqpdd9A326D6D7uBFfr97tjWcfVXoZ7qE/xxo3nG/ggxPUs6r1S8kX
	 yPTbvcjHidtWKhZ+ztOvXqY3IISQd81fABniNU5DsAj4MQ+CqrjmoaVTw35au+d2HfnFN
	 BliAfTmuxHQMHr9u+71un2LOcOIJQ0yGh0daGLBRVdm9oALiuVnmVTZm/4noNFvZ192Yx
	 +ifU76gUZe2SdI57JNvnUwK3hcTGlPin/GG1MX0oZD69MrwVKb5Nf3B7z75C6wUzaPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034081;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=thSjw7hThoV5UbK5MrjC9b4HVokxXqL4i1XxnRsJp+k=;
	b=PwzYmy5IAJdgm5Dy3TQ846NRTxgY4+8o61mXdFYAlD1oyplqcnrHuhevWZaHbSP4hhw5
	 RtReniFrGHufUvN+FHSpE961k63vyxyfB7agf9TjqGGFIiVZ/FGLvVVub6kYpd54cseZS
	 BhHnjngPLJuAYEIDKrJEekWieiQZOvEPapoJHapQ60UWaU8QQFrktR4WGdTxO9mI9MLnS
	 ofsH+3N5+B/navQavPsrXeCzzrNJCkKfsr99hahF+4LG1gZN4QXT8cK+Hwq2kPv1wXXOg
	 0BgtNj3KLmYRZWqaiuESSL5wpIWIVSUAv6VftRz6bVyd4Gjn+B8jcwiqU9lyEgbBhgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=js2tG8w5;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6732960A2600
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 20:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6732960A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=js2tG8w5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795034079; x=1826570079;
  h=date:from:to:cc:subject:message-id;
  bh=daPZNG+gg0r1zUAz86QRks2D2urX1otFGM0f/6cfvss=;
  b=js2tG8w57DVggRFGeV76fxuws5PJC7q0NTR6JziIS+1lTfz4L8BMzlDh
   HeDKn9ok7Vi2QjDwbeaq8EGGlLHr1mLOccBj1KHr7fjqVKd7cR6169lG0
   SPzdww3DrJ6Z2/NFBwMFrHFt+Mvn9u/rXbPyVqZY8x+uuzjLMKUqYFB0S
   5ALLlQLBj+NavNRKQAFjTnYdGcWtGayX3jNsd+jEW0doxI0QdCpI3/aPu
   Lbz1bbDz218hIXNidn6y3FiwkHJXBBBTfGZrB0Yc+nJpj7+br8qQ+SYgI
   95amdB86xQPl/zus3+k89s0GvjaKxGa1TUSVgZV2PvTaIQnxctnhSHhMA
   Q==;
X-CSE-ConnectionGUID: YHE8NvGOQaWBcAeZPvzeLA==
X-CSE-MsgGUID: atTDWOJASRq+3BTIIg2M5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3881550"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3881550"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 12:34:39 -0800
X-CSE-ConnectionGUID: QJVJkWd0QyGrhiFk6hNsMg==
X-CSE-MsgGUID: e4C+TVBNRc22XKD0awbRLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10479641"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 18 Nov 2026 12:34:37 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTmMU-000000003TF-3rhw;
	Wed, 18 Nov 2026 20:34:34 +0000
Date: Wed, 18 Nov 2026 21:33:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.10-lts 29/29]
 fs/cifs/transport.c:1266 compound_send_recv() error: we previously assumed
 'resp_iov' could be null (see line 1242)
Message-ID: <20261118212730.h7mGxFsM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.10-lts
head:   c5acf8d66b6c3d1957c3bbf410370e06a68a6f40
commit: da83fed81241b03fd0e7ccf0091b051cf420d8d2 [29/29] smb: client: close completed creates on compound wait errors
:::::: branch date: 23 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118212730.h7mGxFsM-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261118212730.h7mGxFsM-lkp@intel.com/

smatch warnings:
fs/cifs/transport.c:1266 compound_send_recv() error: we previously assumed 'resp_iov' could be null (see line 1242)

vim +/resp_iov +1266 fs/cifs/transport.c

5f68ea4aa98bcdd Aurelien Aptel     2020-04-22  1028  
b8f57ee8aad414a Pavel Shilovsky    2016-11-23  1029  int
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1030  compound_send_recv(const unsigned int xid, struct cifs_ses *ses,
352d96f3acc6e02 Aurelien Aptel     2020-05-31  1031  		   struct TCP_Server_Info *server,
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1032  		   const int flags, const int num_rqst, struct smb_rqst *rqst,
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1033  		   int *resp_buf_type, struct kvec *resp_iov)
7ee1af765dfa314 Jeremy Allison     2006-08-02  1034  {
480b1cb9dad894f Ronnie Sahlberg    2019-03-08  1035  	int i, j, optype, rc = 0;
da83fed81241b03 Zihan Xi           2026-09-30  1036  	int num_processed = 0;
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1037  	struct mid_q_entry *midQ[MAX_COMPOUND];
8544f4aa9dd19a0 Pavel Shilovsky    2018-12-22  1038  	bool cancelled_mid[MAX_COMPOUND] = {false};
34f4deb7c56c6fd Pavel Shilovsky    2019-01-16  1039  	struct cifs_credits credits[MAX_COMPOUND] = {
34f4deb7c56c6fd Pavel Shilovsky    2019-01-16  1040  		{ .value = 0, .instance = 0 }
34f4deb7c56c6fd Pavel Shilovsky    2019-01-16  1041  	};
34f4deb7c56c6fd Pavel Shilovsky    2019-01-16  1042  	unsigned int instance;
738f9de5cdb9175 Pavel Shilovsky    2016-11-23  1043  	char *buf;
7ee1af765dfa314 Jeremy Allison     2006-08-02  1044  
a891f0f895f4a76 Pavel Shilovsky    2012-05-23  1045  	optype = flags & CIFS_OP_MASK;
133672efbc1085f Steve French       2007-11-13  1046  
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1047  	for (i = 0; i < num_rqst; i++)
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1048  		resp_buf_type[i] = CIFS_NO_BUFFER;  /* no response buf yet */
7ee1af765dfa314 Jeremy Allison     2006-08-02  1049  
352d96f3acc6e02 Aurelien Aptel     2020-05-31  1050  	if (!ses || !ses->server || !server) {
f96637be081141d Joe Perches        2013-05-04  1051  		cifs_dbg(VFS, "Null session\n");
7ee1af765dfa314 Jeremy Allison     2006-08-02  1052  		return -EIO;
7ee1af765dfa314 Jeremy Allison     2006-08-02  1053  	}
7ee1af765dfa314 Jeremy Allison     2006-08-02  1054  
3190b59a050ecdb Aurelien Aptel     2019-06-24  1055  	if (server->tcpStatus == CifsExiting)
7ee1af765dfa314 Jeremy Allison     2006-08-02  1056  		return -ENOENT;
7ee1af765dfa314 Jeremy Allison     2006-08-02  1057  
7091bcaba9f34c8 Pavel Shilovsky    2019-01-30  1058  	/*
257b78099be0157 Ronnie Sahlberg    2019-03-11  1059  	 * Wait for all the requests to become available.
7091bcaba9f34c8 Pavel Shilovsky    2019-01-30  1060  	 * This approach still leaves the possibility to be stuck waiting for
7091bcaba9f34c8 Pavel Shilovsky    2019-01-30  1061  	 * credits if the server doesn't grant credits to the outstanding
257b78099be0157 Ronnie Sahlberg    2019-03-11  1062  	 * requests and if the client is completely idle, not generating any
257b78099be0157 Ronnie Sahlberg    2019-03-11  1063  	 * other requests.
257b78099be0157 Ronnie Sahlberg    2019-03-11  1064  	 * This can be handled by the eventual session reconnect.
792af7b05b8a78d Pavel Shilovsky    2012-03-23  1065  	 */
3190b59a050ecdb Aurelien Aptel     2019-06-24  1066  	rc = wait_for_compound_request(server, num_rqst, flags,
257b78099be0157 Ronnie Sahlberg    2019-03-11  1067  				       &instance);
257b78099be0157 Ronnie Sahlberg    2019-03-11  1068  	if (rc)
257b78099be0157 Ronnie Sahlberg    2019-03-11  1069  		return rc;
97ea499883cc056 Pavel Shilovsky    2019-01-15  1070  
257b78099be0157 Ronnie Sahlberg    2019-03-11  1071  	for (i = 0; i < num_rqst; i++) {
97ea499883cc056 Pavel Shilovsky    2019-01-15  1072  		credits[i].value = 1;
97ea499883cc056 Pavel Shilovsky    2019-01-15  1073  		credits[i].instance = instance;
8544f4aa9dd19a0 Pavel Shilovsky    2018-12-22  1074  	}
7ee1af765dfa314 Jeremy Allison     2006-08-02  1075  
792af7b05b8a78d Pavel Shilovsky    2012-03-23  1076  	/*
792af7b05b8a78d Pavel Shilovsky    2012-03-23  1077  	 * Make sure that we sign in the same order that we send on this socket
792af7b05b8a78d Pavel Shilovsky    2012-03-23  1078  	 * and avoid races inside tcp sendmsg code that could cause corruption
792af7b05b8a78d Pavel Shilovsky    2012-03-23  1079  	 * of smb data.
792af7b05b8a78d Pavel Shilovsky    2012-03-23  1080  	 */
7ee1af765dfa314 Jeremy Allison     2006-08-02  1081  
3190b59a050ecdb Aurelien Aptel     2019-06-24  1082  	mutex_lock(&server->srv_mutex);
7ee1af765dfa314 Jeremy Allison     2006-08-02  1083  
97ea499883cc056 Pavel Shilovsky    2019-01-15  1084  	/*
97ea499883cc056 Pavel Shilovsky    2019-01-15  1085  	 * All the parts of the compound chain belong obtained credits from the
257b78099be0157 Ronnie Sahlberg    2019-03-11  1086  	 * same session. We can not use credits obtained from the previous
97ea499883cc056 Pavel Shilovsky    2019-01-15  1087  	 * session to send this request. Check if there were reconnects after
97ea499883cc056 Pavel Shilovsky    2019-01-15  1088  	 * we obtained credits and return -EAGAIN in such cases to let callers
97ea499883cc056 Pavel Shilovsky    2019-01-15  1089  	 * handle it.
97ea499883cc056 Pavel Shilovsky    2019-01-15  1090  	 */
3190b59a050ecdb Aurelien Aptel     2019-06-24  1091  	if (instance != server->reconnect_instance) {
3190b59a050ecdb Aurelien Aptel     2019-06-24  1092  		mutex_unlock(&server->srv_mutex);
97ea499883cc056 Pavel Shilovsky    2019-01-15  1093  		for (j = 0; j < num_rqst; j++)
3190b59a050ecdb Aurelien Aptel     2019-06-24  1094  			add_credits(server, &credits[j], optype);
97ea499883cc056 Pavel Shilovsky    2019-01-15  1095  		return -EAGAIN;
97ea499883cc056 Pavel Shilovsky    2019-01-15  1096  	}
97ea499883cc056 Pavel Shilovsky    2019-01-15  1097  
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1098  	for (i = 0; i < num_rqst; i++) {
f780bd3fef17c4f Aurelien Aptel     2019-09-20  1099  		midQ[i] = server->ops->setup_request(ses, server, &rqst[i]);
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1100  		if (IS_ERR(midQ[i])) {
3190b59a050ecdb Aurelien Aptel     2019-06-24  1101  			revert_current_mid(server, i);
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1102  			for (j = 0; j < i; j++)
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1103  				cifs_delete_mid(midQ[j]);
3190b59a050ecdb Aurelien Aptel     2019-06-24  1104  			mutex_unlock(&server->srv_mutex);
8544f4aa9dd19a0 Pavel Shilovsky    2018-12-22  1105  
7ee1af765dfa314 Jeremy Allison     2006-08-02  1106  			/* Update # of requests on wire to server */
8544f4aa9dd19a0 Pavel Shilovsky    2018-12-22  1107  			for (j = 0; j < num_rqst; j++)
3190b59a050ecdb Aurelien Aptel     2019-06-24  1108  				add_credits(server, &credits[j], optype);
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1109  			return PTR_ERR(midQ[i]);
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1110  		}
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1111  
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1112  		midQ[i]->mid_state = MID_REQUEST_SUBMITTED;
8a26f0f781f56d3 Pavel Shilovsky    2019-01-03  1113  		midQ[i]->optype = optype;
4e34feb5e96328d Ronnie Sahlberg    2018-08-30  1114  		/*
ee258d79159afed Pavel Shilovsky    2019-01-03  1115  		 * Invoke callback for every part of the compound chain
ee258d79159afed Pavel Shilovsky    2019-01-03  1116  		 * to calculate credits properly. Wake up this thread only when
ee258d79159afed Pavel Shilovsky    2019-01-03  1117  		 * the last element is received.
4e34feb5e96328d Ronnie Sahlberg    2018-08-30  1118  		 */
4e34feb5e96328d Ronnie Sahlberg    2018-08-30  1119  		if (i < num_rqst - 1)
ee258d79159afed Pavel Shilovsky    2019-01-03  1120  			midQ[i]->callback = cifs_compound_callback;
ee258d79159afed Pavel Shilovsky    2019-01-03  1121  		else
ee258d79159afed Pavel Shilovsky    2019-01-03  1122  			midQ[i]->callback = cifs_compound_last_callback;
7ee1af765dfa314 Jeremy Allison     2006-08-02  1123  	}
3190b59a050ecdb Aurelien Aptel     2019-06-24  1124  	rc = smb_send_rqst(server, num_rqst, rqst, flags);
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1125  
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1126  	for (i = 0; i < num_rqst; i++)
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1127  		cifs_save_when_sent(midQ[i]);
7ee1af765dfa314 Jeremy Allison     2006-08-02  1128  
c781af7e0c1fed9 Pavel Shilovsky    2019-03-04  1129  	if (rc < 0) {
3190b59a050ecdb Aurelien Aptel     2019-06-24  1130  		revert_current_mid(server, num_rqst);
3190b59a050ecdb Aurelien Aptel     2019-06-24  1131  		server->sequence_number -= 2;
c781af7e0c1fed9 Pavel Shilovsky    2019-03-04  1132  	}
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1133  
3190b59a050ecdb Aurelien Aptel     2019-06-24  1134  	mutex_unlock(&server->srv_mutex);
7ee1af765dfa314 Jeremy Allison     2006-08-02  1135  
d69cb728e70c402 Ronnie Sahlberg    2019-05-01  1136  	/*
d69cb728e70c402 Ronnie Sahlberg    2019-05-01  1137  	 * If sending failed for some reason or it is an oplock break that we
d69cb728e70c402 Ronnie Sahlberg    2019-05-01  1138  	 * will not receive a response to - return credits back
d69cb728e70c402 Ronnie Sahlberg    2019-05-01  1139  	 */
d69cb728e70c402 Ronnie Sahlberg    2019-05-01  1140  	if (rc < 0 || (flags & CIFS_NO_SRV_RSP)) {
ee258d79159afed Pavel Shilovsky    2019-01-03  1141  		for (i = 0; i < num_rqst; i++)
3190b59a050ecdb Aurelien Aptel     2019-06-24  1142  			add_credits(server, &credits[i], optype);
7ee1af765dfa314 Jeremy Allison     2006-08-02  1143  		goto out;
ee258d79159afed Pavel Shilovsky    2019-01-03  1144  	}
ee258d79159afed Pavel Shilovsky    2019-01-03  1145  
ee258d79159afed Pavel Shilovsky    2019-01-03  1146  	/*
ee258d79159afed Pavel Shilovsky    2019-01-03  1147  	 * At this point the request is passed to the network stack - we assume
ee258d79159afed Pavel Shilovsky    2019-01-03  1148  	 * that any credits taken from the server structure on the client have
ee258d79159afed Pavel Shilovsky    2019-01-03  1149  	 * been spent and we can't return them back. Once we receive responses
ee258d79159afed Pavel Shilovsky    2019-01-03  1150  	 * we will collect credits granted by the server in the mid callbacks
ee258d79159afed Pavel Shilovsky    2019-01-03  1151  	 * and add those credits to the server structure.
ee258d79159afed Pavel Shilovsky    2019-01-03  1152  	 */
7ee1af765dfa314 Jeremy Allison     2006-08-02  1153  
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1154  	/*
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1155  	 * Compounding is never used during session establish.
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1156  	 */
de1126ea44bb259 Vincent Whitchurch 2021-03-10  1157  	if ((ses->status == CifsNew) || (optype & CIFS_NEG_OP)) {
de1126ea44bb259 Vincent Whitchurch 2021-03-10  1158  		mutex_lock(&server->srv_mutex);
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1159  		smb311_update_preauth_hash(ses, rqst[0].rq_iov,
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1160  					   rqst[0].rq_nvec);
de1126ea44bb259 Vincent Whitchurch 2021-03-10  1161  		mutex_unlock(&server->srv_mutex);
de1126ea44bb259 Vincent Whitchurch 2021-03-10  1162  	}
8bd68c6e47abff3 Aurelien Aptel     2018-02-16  1163  
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1164  	for (i = 0; i < num_rqst; i++) {
3190b59a050ecdb Aurelien Aptel     2019-06-24  1165  		rc = wait_for_response(server, midQ[i]);
8a26f0f781f56d3 Pavel Shilovsky    2019-01-03  1166  		if (rc != 0)
8a26f0f781f56d3 Pavel Shilovsky    2019-01-03  1167  			break;
8a26f0f781f56d3 Pavel Shilovsky    2019-01-03  1168  	}
1be912dde772b77 Jeff Layton        2011-01-28  1169  	if (rc != 0) {
da83fed81241b03 Zihan Xi           2026-09-30  1170  		/*
da83fed81241b03 Zihan Xi           2026-09-30  1171  		 * A completed CREATE earlier in the compound chain may have
da83fed81241b03 Zihan Xi           2026-09-30  1172  		 * opened a remote handle even though a later wait was
da83fed81241b03 Zihan Xi           2026-09-30  1173  		 * interrupted. Mark it cancelled so the mid release path
da83fed81241b03 Zihan Xi           2026-09-30  1174  		 * invokes the existing unmatched-open cleanup.
da83fed81241b03 Zihan Xi           2026-09-30  1175  		 */
da83fed81241b03 Zihan Xi           2026-09-30  1176  		spin_lock(&GlobalMid_Lock);
da83fed81241b03 Zihan Xi           2026-09-30  1177  		for (j = 0; j < i; j++)
da83fed81241b03 Zihan Xi           2026-09-30  1178  			midQ[j]->mid_flags |= MID_WAIT_CANCELLED;
da83fed81241b03 Zihan Xi           2026-09-30  1179  		spin_unlock(&GlobalMid_Lock);
da83fed81241b03 Zihan Xi           2026-09-30  1180  
8a26f0f781f56d3 Pavel Shilovsky    2019-01-03  1181  		for (; i < num_rqst; i++) {
b684c380f0b9cd9 Paulo Alcantara    2021-03-08  1182  			cifs_server_dbg(FYI, "Cancelling wait for mid %llu cmd: %d\n",
43de1db36424fd2 Steve French       2018-10-23  1183  				 midQ[i]->mid, le16_to_cpu(midQ[i]->command));
3190b59a050ecdb Aurelien Aptel     2019-06-24  1184  			send_cancel(server, &rqst[i], midQ[i]);
1be912dde772b77 Jeff Layton        2011-01-28  1185  			spin_lock(&GlobalMid_Lock);
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1186  			midQ[i]->mid_flags |= MID_WAIT_CANCELLED;
99960d282fba663 Zhang Xiaoxu       2023-09-19  1187  			if (midQ[i]->mid_state == MID_REQUEST_SUBMITTED ||
99960d282fba663 Zhang Xiaoxu       2023-09-19  1188  			    midQ[i]->mid_state == MID_RESPONSE_RECEIVED) {
8a26f0f781f56d3 Pavel Shilovsky    2019-01-03  1189  				midQ[i]->callback = cifs_cancelled_callback;
8544f4aa9dd19a0 Pavel Shilovsky    2018-12-22  1190  				cancelled_mid[i] = true;
34f4deb7c56c6fd Pavel Shilovsky    2019-01-16  1191  				credits[i].value = 0;
1be912dde772b77 Jeff Layton        2011-01-28  1192  			}
1be912dde772b77 Jeff Layton        2011-01-28  1193  			spin_unlock(&GlobalMid_Lock);
1be912dde772b77 Jeff Layton        2011-01-28  1194  		}
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1195  	}
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1196  
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1197  	for (i = 0; i < num_rqst; i++) {
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1198  		if (rc < 0)
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1199  			goto out;
7ee1af765dfa314 Jeremy Allison     2006-08-02  1200  
3190b59a050ecdb Aurelien Aptel     2019-06-24  1201  		rc = cifs_sync_mid_result(midQ[i], server);
053d50344568e5a Jeff Layton        2011-01-11  1202  		if (rc != 0) {
da83fed81241b03 Zihan Xi           2026-09-30  1203  			/*
da83fed81241b03 Zihan Xi           2026-09-30  1204  			 * A previous CREATE may have completed before this
da83fed81241b03 Zihan Xi           2026-09-30  1205  			 * response failed. Mark it cancelled so its remote
da83fed81241b03 Zihan Xi           2026-09-30  1206  			 * handle is closed when the mid is released.
da83fed81241b03 Zihan Xi           2026-09-30  1207  			 */
da83fed81241b03 Zihan Xi           2026-09-30  1208  			spin_lock(&GlobalMid_Lock);
da83fed81241b03 Zihan Xi           2026-09-30  1209  			for (j = 0; j < i; j++)
da83fed81241b03 Zihan Xi           2026-09-30  1210  				midQ[j]->mid_flags |= MID_WAIT_CANCELLED;
da83fed81241b03 Zihan Xi           2026-09-30  1211  			spin_unlock(&GlobalMid_Lock);
da83fed81241b03 Zihan Xi           2026-09-30  1212  			/* Keep their response buffers for cancelled-mid cleanup. */
da83fed81241b03 Zihan Xi           2026-09-30  1213  			num_processed = 0;
8544f4aa9dd19a0 Pavel Shilovsky    2018-12-22  1214  			/* mark this mid as cancelled to not free it below */
8544f4aa9dd19a0 Pavel Shilovsky    2018-12-22  1215  			cancelled_mid[i] = true;
8544f4aa9dd19a0 Pavel Shilovsky    2018-12-22  1216  			goto out;
d6e04ae64c6b06e Steve French       2005-06-13  1217  		}
d6e04ae64c6b06e Steve French       2005-06-13  1218  
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1219  		if (!midQ[i]->resp_buf ||
99960d282fba663 Zhang Xiaoxu       2023-09-19  1220  		    midQ[i]->mid_state != MID_RESPONSE_READY) {
d6e04ae64c6b06e Steve French       2005-06-13  1221  			rc = -EIO;
f96637be081141d Joe Perches        2013-05-04  1222  			cifs_dbg(FYI, "Bad MID state?\n");
da83fed81241b03 Zihan Xi           2026-09-30  1223  			spin_lock(&GlobalMid_Lock);
da83fed81241b03 Zihan Xi           2026-09-30  1224  			for (j = 0; j < i; j++)
da83fed81241b03 Zihan Xi           2026-09-30  1225  				midQ[j]->mid_flags |= MID_WAIT_CANCELLED;
da83fed81241b03 Zihan Xi           2026-09-30  1226  			spin_unlock(&GlobalMid_Lock);
da83fed81241b03 Zihan Xi           2026-09-30  1227  			num_processed = 0;
2b2bdfba7a3679f Steve French       2008-12-11  1228  			goto out;
2b2bdfba7a3679f Steve French       2008-12-11  1229  		}
2b2bdfba7a3679f Steve French       2008-12-11  1230  
da83fed81241b03 Zihan Xi           2026-09-30  1231  		rc = server->ops->check_receive(midQ[i], server,
da83fed81241b03 Zihan Xi           2026-09-30  1232  						     flags & CIFS_LOG_ERROR);
da83fed81241b03 Zihan Xi           2026-09-30  1233  		num_processed = i + 1;
da83fed81241b03 Zihan Xi           2026-09-30  1234  	}
da83fed81241b03 Zihan Xi           2026-09-30  1235  
da83fed81241b03 Zihan Xi           2026-09-30  1236  out:
da83fed81241b03 Zihan Xi           2026-09-30  1237  	/*
da83fed81241b03 Zihan Xi           2026-09-30  1238  	 * Delay moving response buffers out of their mids until response
da83fed81241b03 Zihan Xi           2026-09-30  1239  	 * synchronization completes. This lets cancelled-mid cleanup inspect
da83fed81241b03 Zihan Xi           2026-09-30  1240  	 * an earlier CREATE response if a later MID fails.
da83fed81241b03 Zihan Xi           2026-09-30  1241  	 */
da83fed81241b03 Zihan Xi           2026-09-30 @1242  	if (resp_iov) {
da83fed81241b03 Zihan Xi           2026-09-30  1243  		for (i = 0; i < num_processed; i++) {
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1244  			buf = (char *)midQ[i]->resp_buf;
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1245  			resp_iov[i].iov_base = buf;
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1246  			resp_iov[i].iov_len = midQ[i]->resp_buf_size +
3190b59a050ecdb Aurelien Aptel     2019-06-24  1247  				server->vals->header_preamble_size;
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1248  
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1249  			if (midQ[i]->large_buf)
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1250  				resp_buf_type[i] = CIFS_LARGE_BUFFER;
ec637e3ffb6b978 Steve French       2005-12-12  1251  			else
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1252  				resp_buf_type[i] = CIFS_SMALL_BUFFER;
a891f0f895f4a76 Pavel Shilovsky    2012-05-23  1253  
3c1bf7e48e9e463 Pavel Shilovsky    2012-09-18  1254  			/* mark it so buf will not be freed by cifs_delete_mid */
392e1c5dc9cc93a Ronnie Sahlberg    2019-05-06  1255  			if ((flags & CIFS_NO_RSP_BUF) == 0)
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1256  				midQ[i]->resp_buf = NULL;
da83fed81241b03 Zihan Xi           2026-09-30  1257  		}
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1258  	}
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1259  
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1260  	/*
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1261  	 * Compounding is never used during session establish.
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1262  	 */
da83fed81241b03 Zihan Xi           2026-09-30  1263  	if (num_processed == num_rqst &&
da83fed81241b03 Zihan Xi           2026-09-30  1264  	    ((ses->status == CifsNew) || (optype & CIFS_NEG_OP))) {
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1265  		struct kvec iov = {
cb5c2e63948451d Ronnie Sahlberg    2018-10-10 @1266  			.iov_base = resp_iov[0].iov_base,
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1267  			.iov_len = resp_iov[0].iov_len
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1268  		};
de1126ea44bb259 Vincent Whitchurch 2021-03-10  1269  		mutex_lock(&server->srv_mutex);
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1270  		smb311_update_preauth_hash(ses, &iov, 1);
de1126ea44bb259 Vincent Whitchurch 2021-03-10  1271  		mutex_unlock(&server->srv_mutex);
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1272  	}
cb5c2e63948451d Ronnie Sahlberg    2018-10-10  1273  
4e34feb5e96328d Ronnie Sahlberg    2018-08-30  1274  	/*
4e34feb5e96328d Ronnie Sahlberg    2018-08-30  1275  	 * This will dequeue all mids. After this it is important that the
4e34feb5e96328d Ronnie Sahlberg    2018-08-30  1276  	 * demultiplex_thread will not process any of these mids any futher.
4e34feb5e96328d Ronnie Sahlberg    2018-08-30  1277  	 * This is prevented above by using a noop callback that will not
4e34feb5e96328d Ronnie Sahlberg    2018-08-30  1278  	 * wake this thread except for the very last PDU.
4e34feb5e96328d Ronnie Sahlberg    2018-08-30  1279  	 */
8544f4aa9dd19a0 Pavel Shilovsky    2018-12-22  1280  	for (i = 0; i < num_rqst; i++) {
8544f4aa9dd19a0 Pavel Shilovsky    2018-12-22  1281  		if (!cancelled_mid[i])
e0bba0b8548179b Ronnie Sahlberg    2018-08-01  1282  			cifs_delete_mid(midQ[i]);
8544f4aa9dd19a0 Pavel Shilovsky    2018-12-22  1283  	}
^1da177e4c3f415 Linus Torvalds     2005-04-16  1284  
d6e04ae64c6b06e Steve French       2005-06-13  1285  	return rc;
d6e04ae64c6b06e Steve French       2005-06-13  1286  }
^1da177e4c3f415 Linus Torvalds     2005-04-16  1287  

:::::: The code at line 1266 was first introduced by commit
:::::: cb5c2e63948451d38c977685fffc06e23beb4517 cifs: fix a credits leak for compund commands

:::::: TO: Ronnie Sahlberg <lsahlber@redhat.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

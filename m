Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AC3539C
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jun 2023 21:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685741105; x=1717277105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sjAT/cud4jF2PI0cEQZqZ3gdE4wGoCp3D/uiFVT2m2Q=;
  b=LabK0JH4Bytqk8MXuEqtGwdQgPCo0upAhjmHZ2xLS98mhYxrrWs+zzIQ
   NmXEVBWfvS5sttr1ajZRgQJ9RmQwrinqAeMRcBIxdefccCRRlGpj7LbxR
   ecnlDPdgIXip0X+13HYtvc7GIeQ2uW91uj7JgebnlZ3eyhy0YMqSfXg9f
   k/eL3r+4fCRZ502ICAKxoHw3k36uuIT5g1MOzWxAwbuV0re4CcpY96458
   SbrQaaI40WRMaJuug57uRQzT1z1tZ9B3uJvrf8k0wgIK87N05cF/zt77s
   N2+CXTcGrMt8BCxNmFzIr1+qnQ1pGmr4VBxPVQ4819DqyaA6OVr55acTf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354825260"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="354825260"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 14:25:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="658403278"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="658403278"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jun 2023 14:25:03 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5CGc-0000zB-2C;
	Fri, 02 Jun 2023 21:25:02 +0000
Date: Sat, 3 Jun 2023 05:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:sendpage-2-tls 8/11] net/tls/tls_sw.c:1126
 tls_sw_sendmsg_locked() error: uninitialized symbol 'msg_pl'.
Message-ID: <202306030515.uaLltWqo-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git sendpage-2-tls
head:   841c31818d08bf5f211ff87263ba12a62ede875f
commit: def4ec8a8024552070285417393c41d4ecd02a3e [8/11] tls/sw: Convert tls_sw_sendpage() to use MSG_SPLICE_PAGES
:::::: branch date: 6 hours ago
:::::: commit date: 7 hours ago
config: mips-randconfig-m041-20230531 (https://download.01.org/0day-ci/archive/20230603/202306030515.uaLltWqo-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306030515.uaLltWqo-lkp@intel.com/

smatch warnings:
net/tls/tls_sw.c:1126 tls_sw_sendmsg_locked() error: uninitialized symbol 'msg_pl'.
net/tls/tls_sw.c:1151 tls_sw_sendmsg_locked() error: uninitialized symbol 'orig_size'.
net/tls/tls_sw.c:1155 tls_sw_sendmsg_locked() error: potentially dereferencing uninitialized 'msg_en'.
net/tls/tls_sw.c:1155 tls_sw_sendmsg_locked() error: uninitialized symbol 'required_size'.

vim +/msg_pl +1126 net/tls/tls_sw.c

1427c2185a94f5 David Howells       2023-03-30   963  
def4ec8a802455 David Howells       2023-03-30   964  static int tls_sw_sendmsg_locked(struct sock *sk, struct msghdr *msg,
def4ec8a802455 David Howells       2023-03-30   965  				 size_t size)
a42055e8d2c30d Vakul Garg          2018-09-21   966  {
3c4d7559159bfe Dave Watson         2017-06-14   967  	long timeo = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
a42055e8d2c30d Vakul Garg          2018-09-21   968  	struct tls_context *tls_ctx = tls_get_ctx(sk);
4509de14680084 Vakul Garg          2019-02-14   969  	struct tls_prot_info *prot = &tls_ctx->prot_info;
a42055e8d2c30d Vakul Garg          2018-09-21   970  	struct tls_sw_context_tx *ctx = tls_sw_ctx_tx(tls_ctx);
5b053e121ffdec Dave Watson         2019-01-30   971  	bool async_capable = ctx->async_capable;
a42055e8d2c30d Vakul Garg          2018-09-21   972  	unsigned char record_type = TLS_RECORD_TYPE_DATA;
00e23707442a75 David Howells       2018-10-22   973  	bool is_kvec = iov_iter_is_kvec(&msg->msg_iter);
3c4d7559159bfe Dave Watson         2017-06-14   974  	bool eor = !(msg->msg_flags & MSG_MORE);
a7bff11f6f9afa Vadim Fedorenko     2020-05-20   975  	size_t try_to_copy;
a7bff11f6f9afa Vadim Fedorenko     2020-05-20   976  	ssize_t copied = 0;
d829e9c4112b52 Daniel Borkmann     2018-10-13   977  	struct sk_msg *msg_pl, *msg_en;
a42055e8d2c30d Vakul Garg          2018-09-21   978  	struct tls_rec *rec;
a42055e8d2c30d Vakul Garg          2018-09-21   979  	int required_size;
a42055e8d2c30d Vakul Garg          2018-09-21   980  	int num_async = 0;
79d4213eb8781d David Howells       2023-06-02   981  	bool full_record = false;
a42055e8d2c30d Vakul Garg          2018-09-21   982  	int record_room;
a42055e8d2c30d Vakul Garg          2018-09-21   983  	int num_zc = 0;
3c4d7559159bfe Dave Watson         2017-06-14   984  	int orig_size;
4128c0cfb1d74c Vakul Garg          2018-09-24   985  	int ret = 0;
0cada33241d9de Vinay Kumar Yadav   2020-05-23   986  	int pending;
3c4d7559159bfe Dave Watson         2017-06-14   987  
3c4d7559159bfe Dave Watson         2017-06-14   988  	if (unlikely(msg->msg_controllen)) {
5879031423089b Jakub Kicinski      2022-07-07   989  		ret = tls_process_cmsg(sk, msg, &record_type);
a42055e8d2c30d Vakul Garg          2018-09-21   990  		if (ret) {
a42055e8d2c30d Vakul Garg          2018-09-21   991  			if (ret == -EINPROGRESS)
a42055e8d2c30d Vakul Garg          2018-09-21   992  				num_async++;
a42055e8d2c30d Vakul Garg          2018-09-21   993  			else if (ret != -EAGAIN)
3c4d7559159bfe Dave Watson         2017-06-14   994  				goto send_end;
3c4d7559159bfe Dave Watson         2017-06-14   995  		}
a42055e8d2c30d Vakul Garg          2018-09-21   996  	}
3c4d7559159bfe Dave Watson         2017-06-14   997  
79d4213eb8781d David Howells       2023-06-02   998  	if (!msg_data_left(msg) && eor)
79d4213eb8781d David Howells       2023-06-02   999  		goto just_flush;
79d4213eb8781d David Howells       2023-06-02  1000  
3c4d7559159bfe Dave Watson         2017-06-14  1001  	while (msg_data_left(msg)) {
3c4d7559159bfe Dave Watson         2017-06-14  1002  		if (sk->sk_err) {
30be8f8dba1bd2 r.hering@avm.de     2018-01-12  1003  			ret = -sk->sk_err;
3c4d7559159bfe Dave Watson         2017-06-14  1004  			goto send_end;
3c4d7559159bfe Dave Watson         2017-06-14  1005  		}
3c4d7559159bfe Dave Watson         2017-06-14  1006  
d3b18ad31f93d0 John Fastabend      2018-10-13  1007  		if (ctx->open_rec)
d3b18ad31f93d0 John Fastabend      2018-10-13  1008  			rec = ctx->open_rec;
d3b18ad31f93d0 John Fastabend      2018-10-13  1009  		else
d3b18ad31f93d0 John Fastabend      2018-10-13  1010  			rec = ctx->open_rec = tls_get_rec(sk);
a42055e8d2c30d Vakul Garg          2018-09-21  1011  		if (!rec) {
a42055e8d2c30d Vakul Garg          2018-09-21  1012  			ret = -ENOMEM;
a42055e8d2c30d Vakul Garg          2018-09-21  1013  			goto send_end;
a42055e8d2c30d Vakul Garg          2018-09-21  1014  		}
a42055e8d2c30d Vakul Garg          2018-09-21  1015  
d829e9c4112b52 Daniel Borkmann     2018-10-13  1016  		msg_pl = &rec->msg_plaintext;
d829e9c4112b52 Daniel Borkmann     2018-10-13  1017  		msg_en = &rec->msg_encrypted;
d829e9c4112b52 Daniel Borkmann     2018-10-13  1018  
d829e9c4112b52 Daniel Borkmann     2018-10-13  1019  		orig_size = msg_pl->sg.size;
3c4d7559159bfe Dave Watson         2017-06-14  1020  		full_record = false;
3c4d7559159bfe Dave Watson         2017-06-14  1021  		try_to_copy = msg_data_left(msg);
d829e9c4112b52 Daniel Borkmann     2018-10-13  1022  		record_room = TLS_MAX_PAYLOAD_SIZE - msg_pl->sg.size;
3c4d7559159bfe Dave Watson         2017-06-14  1023  		if (try_to_copy >= record_room) {
3c4d7559159bfe Dave Watson         2017-06-14  1024  			try_to_copy = record_room;
3c4d7559159bfe Dave Watson         2017-06-14  1025  			full_record = true;
3c4d7559159bfe Dave Watson         2017-06-14  1026  		}
3c4d7559159bfe Dave Watson         2017-06-14  1027  
d829e9c4112b52 Daniel Borkmann     2018-10-13  1028  		required_size = msg_pl->sg.size + try_to_copy +
4509de14680084 Vakul Garg          2019-02-14  1029  				prot->overhead_size;
3c4d7559159bfe Dave Watson         2017-06-14  1030  
3c4d7559159bfe Dave Watson         2017-06-14  1031  		if (!sk_stream_memory_free(sk))
3c4d7559159bfe Dave Watson         2017-06-14  1032  			goto wait_for_sndbuf;
a42055e8d2c30d Vakul Garg          2018-09-21  1033  
3c4d7559159bfe Dave Watson         2017-06-14  1034  alloc_encrypted:
d829e9c4112b52 Daniel Borkmann     2018-10-13  1035  		ret = tls_alloc_encrypted_msg(sk, required_size);
3c4d7559159bfe Dave Watson         2017-06-14  1036  		if (ret) {
3c4d7559159bfe Dave Watson         2017-06-14  1037  			if (ret != -ENOSPC)
3c4d7559159bfe Dave Watson         2017-06-14  1038  				goto wait_for_memory;
3c4d7559159bfe Dave Watson         2017-06-14  1039  
3c4d7559159bfe Dave Watson         2017-06-14  1040  			/* Adjust try_to_copy according to the amount that was
3c4d7559159bfe Dave Watson         2017-06-14  1041  			 * actually allocated. The difference is due
3c4d7559159bfe Dave Watson         2017-06-14  1042  			 * to max sg elements limit
3c4d7559159bfe Dave Watson         2017-06-14  1043  			 */
d829e9c4112b52 Daniel Borkmann     2018-10-13  1044  			try_to_copy -= required_size - msg_en->sg.size;
3c4d7559159bfe Dave Watson         2017-06-14  1045  			full_record = true;
3c4d7559159bfe Dave Watson         2017-06-14  1046  		}
a42055e8d2c30d Vakul Garg          2018-09-21  1047  
1427c2185a94f5 David Howells       2023-03-30  1048  		if (try_to_copy && (msg->msg_flags & MSG_SPLICE_PAGES)) {
1427c2185a94f5 David Howells       2023-03-30  1049  			ret = tls_sw_sendmsg_splice(sk, msg, msg_pl,
1427c2185a94f5 David Howells       2023-03-30  1050  						    try_to_copy, &copied);
1427c2185a94f5 David Howells       2023-03-30  1051  			if (ret < 0)
1427c2185a94f5 David Howells       2023-03-30  1052  				goto send_end;
1427c2185a94f5 David Howells       2023-03-30  1053  			tls_ctx->pending_open_record_frags = true;
1427c2185a94f5 David Howells       2023-03-30  1054  			if (full_record || eor || sk_msg_full(msg_pl))
1427c2185a94f5 David Howells       2023-03-30  1055  				goto copied;
1427c2185a94f5 David Howells       2023-03-30  1056  			continue;
1427c2185a94f5 David Howells       2023-03-30  1057  		}
1427c2185a94f5 David Howells       2023-03-30  1058  
a42055e8d2c30d Vakul Garg          2018-09-21  1059  		if (!is_kvec && (full_record || eor) && !async_capable) {
d3b18ad31f93d0 John Fastabend      2018-10-13  1060  			u32 first = msg_pl->sg.end;
d3b18ad31f93d0 John Fastabend      2018-10-13  1061  
d829e9c4112b52 Daniel Borkmann     2018-10-13  1062  			ret = sk_msg_zerocopy_from_iter(sk, &msg->msg_iter,
d829e9c4112b52 Daniel Borkmann     2018-10-13  1063  							msg_pl, try_to_copy);
3c4d7559159bfe Dave Watson         2017-06-14  1064  			if (ret)
3c4d7559159bfe Dave Watson         2017-06-14  1065  				goto fallback_to_reg_send;
3c4d7559159bfe Dave Watson         2017-06-14  1066  
a42055e8d2c30d Vakul Garg          2018-09-21  1067  			num_zc++;
3c4d7559159bfe Dave Watson         2017-06-14  1068  			copied += try_to_copy;
d3b18ad31f93d0 John Fastabend      2018-10-13  1069  
d3b18ad31f93d0 John Fastabend      2018-10-13  1070  			sk_msg_sg_copy_set(msg_pl, first);
d3b18ad31f93d0 John Fastabend      2018-10-13  1071  			ret = bpf_exec_tx_verdict(msg_pl, sk, full_record,
d3b18ad31f93d0 John Fastabend      2018-10-13  1072  						  record_type, &copied,
d3b18ad31f93d0 John Fastabend      2018-10-13  1073  						  msg->msg_flags);
a42055e8d2c30d Vakul Garg          2018-09-21  1074  			if (ret) {
a42055e8d2c30d Vakul Garg          2018-09-21  1075  				if (ret == -EINPROGRESS)
a42055e8d2c30d Vakul Garg          2018-09-21  1076  					num_async++;
d3b18ad31f93d0 John Fastabend      2018-10-13  1077  				else if (ret == -ENOMEM)
d3b18ad31f93d0 John Fastabend      2018-10-13  1078  					goto wait_for_memory;
c329ef9684de95 Jakub Kicinski      2019-11-27  1079  				else if (ctx->open_rec && ret == -ENOSPC)
d3b18ad31f93d0 John Fastabend      2018-10-13  1080  					goto rollback_iter;
a42055e8d2c30d Vakul Garg          2018-09-21  1081  				else if (ret != -EAGAIN)
3c4d7559159bfe Dave Watson         2017-06-14  1082  					goto send_end;
a42055e8d2c30d Vakul Garg          2018-09-21  1083  			}
5a3611efe5b309 Doron Roberts-Kedes 2018-07-26  1084  			continue;
d3b18ad31f93d0 John Fastabend      2018-10-13  1085  rollback_iter:
d3b18ad31f93d0 John Fastabend      2018-10-13  1086  			copied -= try_to_copy;
d3b18ad31f93d0 John Fastabend      2018-10-13  1087  			sk_msg_sg_copy_clear(msg_pl, first);
d3b18ad31f93d0 John Fastabend      2018-10-13  1088  			iov_iter_revert(&msg->msg_iter,
d3b18ad31f93d0 John Fastabend      2018-10-13  1089  					msg_pl->sg.size - orig_size);
3c4d7559159bfe Dave Watson         2017-06-14  1090  fallback_to_reg_send:
d829e9c4112b52 Daniel Borkmann     2018-10-13  1091  			sk_msg_trim(sk, msg_pl, orig_size);
3c4d7559159bfe Dave Watson         2017-06-14  1092  		}
3c4d7559159bfe Dave Watson         2017-06-14  1093  
d829e9c4112b52 Daniel Borkmann     2018-10-13  1094  		required_size = msg_pl->sg.size + try_to_copy;
4e6d47206c32d1 Vakul Garg          2018-09-30  1095  
d829e9c4112b52 Daniel Borkmann     2018-10-13  1096  		ret = tls_clone_plaintext_msg(sk, required_size);
3c4d7559159bfe Dave Watson         2017-06-14  1097  		if (ret) {
3c4d7559159bfe Dave Watson         2017-06-14  1098  			if (ret != -ENOSPC)
4e6d47206c32d1 Vakul Garg          2018-09-30  1099  				goto send_end;
3c4d7559159bfe Dave Watson         2017-06-14  1100  
3c4d7559159bfe Dave Watson         2017-06-14  1101  			/* Adjust try_to_copy according to the amount that was
3c4d7559159bfe Dave Watson         2017-06-14  1102  			 * actually allocated. The difference is due
3c4d7559159bfe Dave Watson         2017-06-14  1103  			 * to max sg elements limit
3c4d7559159bfe Dave Watson         2017-06-14  1104  			 */
d829e9c4112b52 Daniel Borkmann     2018-10-13  1105  			try_to_copy -= required_size - msg_pl->sg.size;
3c4d7559159bfe Dave Watson         2017-06-14  1106  			full_record = true;
4509de14680084 Vakul Garg          2019-02-14  1107  			sk_msg_trim(sk, msg_en,
4509de14680084 Vakul Garg          2019-02-14  1108  				    msg_pl->sg.size + prot->overhead_size);
3c4d7559159bfe Dave Watson         2017-06-14  1109  		}
3c4d7559159bfe Dave Watson         2017-06-14  1110  
65a10e28aee729 Vakul Garg          2018-12-21  1111  		if (try_to_copy) {
65a10e28aee729 Vakul Garg          2018-12-21  1112  			ret = sk_msg_memcopy_from_iter(sk, &msg->msg_iter,
65a10e28aee729 Vakul Garg          2018-12-21  1113  						       msg_pl, try_to_copy);
d829e9c4112b52 Daniel Borkmann     2018-10-13  1114  			if (ret < 0)
3c4d7559159bfe Dave Watson         2017-06-14  1115  				goto trim_sgl;
65a10e28aee729 Vakul Garg          2018-12-21  1116  		}
3c4d7559159bfe Dave Watson         2017-06-14  1117  
d829e9c4112b52 Daniel Borkmann     2018-10-13  1118  		/* Open records defined only if successfully copied, otherwise
d829e9c4112b52 Daniel Borkmann     2018-10-13  1119  		 * we would trim the sg but not reset the open record frags.
d829e9c4112b52 Daniel Borkmann     2018-10-13  1120  		 */
3c4d7559159bfe Dave Watson         2017-06-14  1121  		copied += try_to_copy;
1427c2185a94f5 David Howells       2023-03-30  1122  copied:
1427c2185a94f5 David Howells       2023-03-30  1123  		tls_ctx->pending_open_record_frags = true;
79d4213eb8781d David Howells       2023-06-02  1124  just_flush:
3c4d7559159bfe Dave Watson         2017-06-14  1125  		if (full_record || eor) {
d3b18ad31f93d0 John Fastabend      2018-10-13 @1126  			ret = bpf_exec_tx_verdict(msg_pl, sk, full_record,
d3b18ad31f93d0 John Fastabend      2018-10-13  1127  						  record_type, &copied,
d3b18ad31f93d0 John Fastabend      2018-10-13  1128  						  msg->msg_flags);
3c4d7559159bfe Dave Watson         2017-06-14  1129  			if (ret) {
a42055e8d2c30d Vakul Garg          2018-09-21  1130  				if (ret == -EINPROGRESS)
a42055e8d2c30d Vakul Garg          2018-09-21  1131  					num_async++;
d3b18ad31f93d0 John Fastabend      2018-10-13  1132  				else if (ret == -ENOMEM)
d3b18ad31f93d0 John Fastabend      2018-10-13  1133  					goto wait_for_memory;
d3b18ad31f93d0 John Fastabend      2018-10-13  1134  				else if (ret != -EAGAIN) {
d3b18ad31f93d0 John Fastabend      2018-10-13  1135  					if (ret == -ENOSPC)
d3b18ad31f93d0 John Fastabend      2018-10-13  1136  						ret = 0;
3c4d7559159bfe Dave Watson         2017-06-14  1137  					goto send_end;
3c4d7559159bfe Dave Watson         2017-06-14  1138  				}
3c4d7559159bfe Dave Watson         2017-06-14  1139  			}
d3b18ad31f93d0 John Fastabend      2018-10-13  1140  		}
3c4d7559159bfe Dave Watson         2017-06-14  1141  
3c4d7559159bfe Dave Watson         2017-06-14  1142  		continue;
3c4d7559159bfe Dave Watson         2017-06-14  1143  
3c4d7559159bfe Dave Watson         2017-06-14  1144  wait_for_sndbuf:
3c4d7559159bfe Dave Watson         2017-06-14  1145  		set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
3c4d7559159bfe Dave Watson         2017-06-14  1146  wait_for_memory:
3c4d7559159bfe Dave Watson         2017-06-14  1147  		ret = sk_stream_wait_memory(sk, &timeo);
3c4d7559159bfe Dave Watson         2017-06-14  1148  		if (ret) {
3c4d7559159bfe Dave Watson         2017-06-14  1149  trim_sgl:
c329ef9684de95 Jakub Kicinski      2019-11-27  1150  			if (ctx->open_rec)
d829e9c4112b52 Daniel Borkmann     2018-10-13 @1151  				tls_trim_both_msgs(sk, orig_size);
3c4d7559159bfe Dave Watson         2017-06-14  1152  			goto send_end;
3c4d7559159bfe Dave Watson         2017-06-14  1153  		}
3c4d7559159bfe Dave Watson         2017-06-14  1154  
c329ef9684de95 Jakub Kicinski      2019-11-27 @1155  		if (ctx->open_rec && msg_en->sg.size < required_size)
3c4d7559159bfe Dave Watson         2017-06-14  1156  			goto alloc_encrypted;
3c4d7559159bfe Dave Watson         2017-06-14  1157  	}
3c4d7559159bfe Dave Watson         2017-06-14  1158  
a42055e8d2c30d Vakul Garg          2018-09-21  1159  	if (!num_async) {
a42055e8d2c30d Vakul Garg          2018-09-21  1160  		goto send_end;
a42055e8d2c30d Vakul Garg          2018-09-21  1161  	} else if (num_zc) {
a42055e8d2c30d Vakul Garg          2018-09-21  1162  		/* Wait for pending encryptions to get completed */
0cada33241d9de Vinay Kumar Yadav   2020-05-23  1163  		spin_lock_bh(&ctx->encrypt_compl_lock);
0cada33241d9de Vinay Kumar Yadav   2020-05-23  1164  		ctx->async_notify = true;
a42055e8d2c30d Vakul Garg          2018-09-21  1165  
0cada33241d9de Vinay Kumar Yadav   2020-05-23  1166  		pending = atomic_read(&ctx->encrypt_pending);
0cada33241d9de Vinay Kumar Yadav   2020-05-23  1167  		spin_unlock_bh(&ctx->encrypt_compl_lock);
0cada33241d9de Vinay Kumar Yadav   2020-05-23  1168  		if (pending)
a42055e8d2c30d Vakul Garg          2018-09-21  1169  			crypto_wait_req(-EINPROGRESS, &ctx->async_wait);
a42055e8d2c30d Vakul Garg          2018-09-21  1170  		else
a42055e8d2c30d Vakul Garg          2018-09-21  1171  			reinit_completion(&ctx->async_wait.completion);
a42055e8d2c30d Vakul Garg          2018-09-21  1172  
0cada33241d9de Vinay Kumar Yadav   2020-05-23  1173  		/* There can be no concurrent accesses, since we have no
0cada33241d9de Vinay Kumar Yadav   2020-05-23  1174  		 * pending encrypt operations
0cada33241d9de Vinay Kumar Yadav   2020-05-23  1175  		 */
a42055e8d2c30d Vakul Garg          2018-09-21  1176  		WRITE_ONCE(ctx->async_notify, false);
a42055e8d2c30d Vakul Garg          2018-09-21  1177  
a42055e8d2c30d Vakul Garg          2018-09-21  1178  		if (ctx->async_wait.err) {
a42055e8d2c30d Vakul Garg          2018-09-21  1179  			ret = ctx->async_wait.err;
a42055e8d2c30d Vakul Garg          2018-09-21  1180  			copied = 0;
a42055e8d2c30d Vakul Garg          2018-09-21  1181  		}
a42055e8d2c30d Vakul Garg          2018-09-21  1182  	}
a42055e8d2c30d Vakul Garg          2018-09-21  1183  
a42055e8d2c30d Vakul Garg          2018-09-21  1184  	/* Transmit if any encryptions have completed */
a42055e8d2c30d Vakul Garg          2018-09-21  1185  	if (test_and_clear_bit(BIT_TX_SCHEDULED, &ctx->tx_bitmask)) {
a42055e8d2c30d Vakul Garg          2018-09-21  1186  		cancel_delayed_work(&ctx->tx_work.work);
a42055e8d2c30d Vakul Garg          2018-09-21  1187  		tls_tx_records(sk, msg->msg_flags);
a42055e8d2c30d Vakul Garg          2018-09-21  1188  	}
a42055e8d2c30d Vakul Garg          2018-09-21  1189  
3c4d7559159bfe Dave Watson         2017-06-14  1190  send_end:
3c4d7559159bfe Dave Watson         2017-06-14  1191  	ret = sk_stream_error(sk, msg->msg_flags, ret);
a7bff11f6f9afa Vadim Fedorenko     2020-05-20  1192  	return copied > 0 ? copied : ret;
3c4d7559159bfe Dave Watson         2017-06-14  1193  }
3c4d7559159bfe Dave Watson         2017-06-14  1194  

:::::: The code at line 1126 was first introduced by commit
:::::: d3b18ad31f93d0b6bae105c679018a1ba7daa9ca tls: add bpf support to sk_msg handling

:::::: TO: John Fastabend <john.fastabend@gmail.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

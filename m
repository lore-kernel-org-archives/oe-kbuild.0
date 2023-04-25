Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1757B
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Apr 2023 01:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682387712; x=1713923712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NThRKCfSZOrjUatGV06fb7qTkQ4RMxlqe7J03T9887E=;
  b=XWvgI5xYZl/4gVAaAVE6XZRhnvyA5nWK3+jrkhH+OiLe2Wrrz/ZJdQrv
   0pgEABgGkEECNH0V5qcfVdUdd2XswkQPrp7R5Ac+76AJWiNt0K7zkVvt+
   Oy5moUPOozUmYFZDwmaOQO5I/YXY9nsQ3VU2pYVkCYJapVkuzXc1VzIeR
   ETR+PoWmBr+Mc/Pd6US3dPgGvXwKALqH6Rus/qj8CGK9fkoQ1Lr7g1OBt
   SS3vfeOElQ40qMPJ8UjGrW1XKjg3vqZXV8AdBW7EsnZx+kumyWcd2KgjC
   BrzwS7bw9iaP3vEioRkGXPCw40rrMvchDBEUMLuAaey+2r++262kk0rds
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="349422913"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="349422913"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 18:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="725916572"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="725916572"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Apr 2023 18:55:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr7td-000ipw-2O;
	Tue, 25 Apr 2023 01:55:09 +0000
Date: Tue, 25 Apr 2023 09:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [mhiramat:topic/fprobe-event-ext 7/9]
 kernel/trace/trace_probe.c:1166 traceprobe_expand_meta_args() error: passing
 non negative 2147483646 to ERR_PTR
Message-ID: <202304250906.1DDbxMvm-lkp@intel.com>
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
TO: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-event-ext
head:   356a6c2bfcfb9c9b9149dd63b22b2f1621290b9b
commit: 8fb17a0a98bcd2bfb129170824cca3ffd6cbb7a0 [7/9] tracing/probes: Add $$args meta argument for all function args
:::::: branch date: 11 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230425/202304250906.1DDbxMvm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304250906.1DDbxMvm-lkp@intel.com/

smatch warnings:
kernel/trace/trace_probe.c:1166 traceprobe_expand_meta_args() error: passing non negative 2147483646 to ERR_PTR

vim +1166 kernel/trace/trace_probe.c

8ab83f56475ec9 Srikar Dronamraju         2012-04-09  1081  
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1082) /* Return new_argv which must be freed after use */
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1083) const char **traceprobe_expand_meta_args(int argc, const char *argv[],
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1084) 					 int *new_argc, char *buf, int bufsize,
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1085) 					 struct traceprobe_parse_context *ctx)
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1086) {
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1087) 	struct btf *btf = traceprobe_get_btf();
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1088) 	const struct btf_param *params = NULL;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1089) 	int i, j, used, ret, args_idx = -1;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1090) 	const char **new_argv = NULL;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1091) 	int nr_skipped;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1092) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1093) 	/* The first argument of tracepoint should be skipped. */
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1094) 	nr_skipped = ctx->flags & TPARG_FL_TPOINT ? 1 : 0;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1095) 	for (i = 0; i < argc; i++)
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1096) 		if (!strcmp(argv[i], "$$args")) {
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1097) 			trace_probe_log_set_index(i + 2);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1098) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1099) 			if (!tparg_is_function_entry(ctx->flags)) {
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1100) 				trace_probe_log_err(0, NOFENTRY_ARGS);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1101) 				return ERR_PTR(-EINVAL);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1102) 			}
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1103) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1104) 			if (args_idx >= 0) {
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1105) 				trace_probe_log_err(0, DOUBLE_ARGS);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1106) 				return ERR_PTR(-EINVAL);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1107) 			}
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1108) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1109) 			args_idx = i;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1110) 			params = find_btf_func_param(ctx->funcname, &ctx->nr_params);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1111) 			if (IS_ERR(params)) {
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1112) 				trace_probe_log_err(0, NOSUP_BTFARG);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1113) 				return (const char **)params;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1114) 			}
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1115) 			ctx->params = params;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1116) 		}
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1117) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1118) 	/* If target has no arguments, return NULL and the original argc. */
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1119) 	if (args_idx < 0 || ctx->nr_params < nr_skipped) {
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1120) 		*new_argc = argc;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1121) 		return NULL;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1122) 	}
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1123) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1124) 	*new_argc = argc - 1 + ctx->nr_params - nr_skipped;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1125) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1126) 	new_argv = kcalloc(*new_argc, sizeof(char *), GFP_KERNEL);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1127) 	if (!new_argv)
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1128) 		return ERR_PTR(-ENOMEM);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1129) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1130) 	for (i = 0; i < args_idx; i++)
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1131) 		new_argv[i] = argv[i];
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1132) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1133) 	used = 0;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1134) 	trace_probe_log_set_index(args_idx + 2);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1135) 	for (i = 0; i < ctx->nr_params - nr_skipped; i++) {
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1136) 		const char *name;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1137) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1138) 		name = btf_name_by_offset(btf, params[i + nr_skipped].name_off);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1139) 		if (!name) {
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1140) 			trace_probe_log_err(0, NO_BTF_ENTRY);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1141) 			ret = -ENOENT;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1142) 			goto error;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1143) 		}
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1144) 		ret = snprintf(buf + used, bufsize - used, "%s", name);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1145) 		if (ret >= bufsize - used) {
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1146) 			trace_probe_log_err(0, ARGS_2LONG);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1147) 			ret = -E2BIG;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1148) 			goto error;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1149) 		}
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1150) 		new_argv[args_idx + i] = buf + used;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1151) 		used += ret + 1; /* include null byte */
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1152) 	}
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1153) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1154) 	/* Note: we have to skip $$args */
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1155) 	j = args_idx + ctx->nr_params - nr_skipped;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1156) 	for (i = args_idx + 1; i < argc; i++, j++) {
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1157) 		if (WARN_ON(j >= *new_argc))
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1158) 			goto error;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1159) 		new_argv[j] = argv[i];
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1160) 	}
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1161) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1162) 	return new_argv;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1163) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1164) error:
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1165) 	kfree(new_argv);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24 @1166) 	return ERR_PTR(ret);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1167) }
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1168) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

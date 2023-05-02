Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5364AECC
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 11:24:04 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f315712406so164269595e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 02 May 2023 04:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683026641; x=1685618641;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tO+ixy+CyDpafoLpBM85s3fl8hHxYZO9ndfQmyOANz4=;
        b=sD6LWXVDQw9v73vmDlMCb7mpyS3sJbmck7PtsXjJTpwKl7cN50c9qbYCFgEvqZvKEm
         wUII8cOtPK6XpQpvLs0ubc08b7fgthILM8TqIssjrUK94s2zhEhfqcVuqS5G0+vOK4i6
         it+nCSfQ84OAvBmWh3tO09yWjF0uk0OMcwcyYzEYhqvKHC+HsrNpQ4vpr3G0r0RkjFNU
         lX3Ietun92v066RoTK4KmRVy9yIIizHIDl/oOkEDrlbDdZo8eMPNQ5dogZhyB3/GROYE
         I3WhyYwuoKnP+9NKB4kInUmrgtry4KLsLCqz54EeYoNnofDRI1pDp5vd7TS7ulITrsO0
         MOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683026641; x=1685618641;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tO+ixy+CyDpafoLpBM85s3fl8hHxYZO9ndfQmyOANz4=;
        b=evFTtDFWs4ip3GAQT7dsdrwV+OgXo0kWgdZwjXhUPxfsv5gTNBxyr1qKgViYAkpyvy
         //L2bXflL3rUGnaO+CW8+kNjF3B2JGN7sWjgdJ89tcbxIAnIPKCoOIKSBfzUCfdJ6N5j
         0E1/69Hb06wKhvepVCJep9g4b79xdPQhydaqkCwGCsg02TDIzI+vQTuEspHGKTcUmlra
         IokRi2zM1vR2ybnmIh46CCSi6Po2ca+o5kptGQ1sxf+Unxt8EGADrFX8ON0Hg5vnJbWy
         CQ7ETA2sxk2nNEzBK+58+0JnnE8nX/1jo+HDZPzjhP8GYWq0az3VZLX5r1QoH9Iz4QG9
         O64g==
X-Gm-Message-State: AC+VfDzqNNaBdXnP8A5Sk4HAWG4GE6gC0mdFfe1HB+nD3GEwcQYd8SkD
	7ElM6zLG1JBsCj1C0YqDWiovemF32hnkivyVud8=
X-Google-Smtp-Source: ACHHUZ79UBk33zdGxGuYYA0oReI+zUDaSs1fSmMNLT3j13NshBDJq/gizV8Nw2lor2+Z0xVXWFBhjQ==
X-Received: by 2002:a05:600c:4f55:b0:3f1:88b:bd40 with SMTP id m21-20020a05600c4f5500b003f1088bbd40mr13083975wmq.14.1683026641552;
        Tue, 02 May 2023 04:24:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c22d500b003f17131952fsm35423542wmg.29.2023.05.02.04.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 04:24:00 -0700 (PDT)
Date: Tue, 2 May 2023 14:23:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-event-ext 7/9]
 kernel/trace/trace_probe.c:1166 traceprobe_expand_meta_args() error: passing
 non negative 2147483646 to ERR_PTR
Message-ID: <c6d09b35-2858-47c9-bec7-d43a90abf8cb@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-event-ext
head:   356a6c2bfcfb9c9b9149dd63b22b2f1621290b9b
commit: 8fb17a0a98bcd2bfb129170824cca3ffd6cbb7a0 [7/9] tracing/probes: Add $$args meta argument for all function args
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

ret is set to positive here.

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

Missing error code will lead to crash.

8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1159) 		new_argv[j] = argv[i];
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1160) 	}
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1161) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1162) 	return new_argv;
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1163) 
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1164) error:
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1165) 	kfree(new_argv);
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24 @1166) 	return ERR_PTR(ret);

Will crash in caller function.

8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1167) }
8fb17a0a98bcd2 Masami Hiramatsu (Google  2023-04-24  1168) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


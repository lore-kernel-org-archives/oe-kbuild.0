Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52D33BE166
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774335116; cv=none; b=sE6CMmobLUFr8ujLgRJb9rm7flWjzhCrn1Fa2PIpna4SdJWNupxaqqogU0zWQEk7ZdV5Ojg/lafGXOokqEfO5D0fjqnbYgD10Q4kzxReGQNgQaPWSDR5QJR3xSMoGX+2FnbMdUia1j5bqjuECDIavbGehTmoQw+enXdoMUOtX1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774335116; c=relaxed/simple;
	bh=VCtse7tAdTCA5ZJIBrW0eGxWEBkFF83C5PCbdKrhPeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pnIwSszrqw2siCNksz2AWArtIYrZ5iUEAORtDHKWItM6Q78NZXLiqpibuoE9Ox+I6BMwqu2fzVDsva0TgNWqTdGMPeyexsTg5soNjnuUDW8SVi2zhFMod/tPuT/wA9H2TxvuefnW9tB0jTUuE3o2CDPZYmFbru18QFi2+rW/pDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zaHcm/5U; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zaHcm/5U"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486b9675d36so40694325e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 23:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774335104; x=1774939904; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DK47Cs15T9o8qt84I0FUwLw3AfJ/Ss95D5OXzj/f7u8=;
        b=zaHcm/5UO27ps9L0QNQ4BKDvJcbeX6KUwNOx7JPNNiJ4YK8JUFWKPNeJ1gMe84xkfS
         pwSLoX8SE2bWt9w8s234m0Y8gInaMuxX7HorRCzhb2JvAyxhfEUPu9XixsbtapyP89Ok
         Pbr3R1+VjMk+LY//AbfhjsgLcJ37HeA2WzK2bzSuKCaAZ+1jZOrV7xRSVJZfSPhOPq8Q
         HOWDZEJH73eim0r1vj1/ehRwl4MCaBO7yDTMZZp13SoPKRt634dJATLrCmrGbhbZnb6K
         TCMmmXQ0wJ5DoPv7oJZPlQBREUfKf9KQ1XdOFQG+y3HOqlgkljRDXajB23T0t9v2rpDV
         Aydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774335104; x=1774939904;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DK47Cs15T9o8qt84I0FUwLw3AfJ/Ss95D5OXzj/f7u8=;
        b=CbQCTWfEU6ZdAYSQjHWqUsqPuOc45tLEOWsRa5p/3bwa/ggXJ5wWyvcIgf7Lq6UxXx
         kKdbtmMwoKGBGnjMhllWwE6v3esnrSMfOayYUKw5kPfg63yS2VuoW6tycx0pqQEY7mbL
         dW+EaeBxFU7ckk9yQQZGQeGSv2ZMwNPBL+lz3e3MghzhRiTyNGykamkEvz1ps2obxpDI
         mGo0wHWQgJVdG1rGq69mJGKeJehw01t+GzyBnVU32wsjKHxANxCY6+cYnY4FKSjglOyO
         ijx7iLNKfkkG3l2MnBzaJuaBofSSSz21J7TLQX3mPT3Zy2Vx/ZRsq544Mp1uLp93Yhik
         PDfA==
X-Gm-Message-State: AOJu0YyvNn4V7ElUWfriV/a5Ie+emGwIIQfUGvzmPqk5tx9OuJdqrGrR
	ir3U6ImJp3Lhk92nK2DZJ84xJYwOXrht8Kd1wjVvEXEqeG/vsRlz5iksuq6QowQjCc5xd89mfsp
	pkUYV
X-Gm-Gg: ATEYQzwGv/22pCctUss9HfUekc+zeFDPlVUbFJBpRkGha2v0e6jXpMpbAdSm5lYyFkB
	zS0uvPfL7+sBhwahgFfsAhhXdIX5eriQxay8+h+RnnvMkGl3FF9wYLXQ+0ATx4yISCu1ginIa/Y
	S7T8vdBum7+O8TB8M17oHTYYj/ZNKK/6NyLF+OBIeW8VECVD0pAFB6winyEBpgJhF3T/RnodWN+
	RbteY6m9pwaI8XOJLB5TXkVkUTmEl/DHL0LHtFgp6m/YAp359ceFKqTFgvF+446WM6jKbirElo8
	yzERDU1qAcHvz9/itNmhiu8Yda7aKnl7qxAB4BRXRWhHZuZMgOn0NDtbNQbi/rNEhzSLLvVh0vr
	tI1Y6qZBkZ3Sx5TJiDK4fyygHSraBr8uNiLN3WLHDMEL/vreLzV2lt8ovk86sMQ+Tyw0LB+3AdX
	POsb2a0aJqkGnA5MbooxkwlmzlGaw1
X-Received: by 2002:a05:600c:8b31:b0:485:469f:5320 with SMTP id 5b1f17b1804b1-486fee2d9e0mr213160815e9.30.1774335103411;
        Mon, 23 Mar 2026 23:51:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116d82f1sm27501465e9.11.2026.03.23.23.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 23:51:42 -0700 (PDT)
Date: Tue, 24 Mar 2026 09:51:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mahesh Rao <mahesh.rao@altera.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: drivers/firmware/stratix10-svc.c:1119
 stratix10_svc_add_async_client() error: Calling ida_alloc_max() with a 'max'
 argument which is a power of 2. -1 missing?
Message-ID: <202603241328.naBWhr1K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260324065139.p5mY8VsPeVmpC71QRdFmHinrK7Ri3ReMI7fgtS1LBKQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: bcb9f4f0706147afc62c48533276a18fe7b8f354 firmware: stratix10-svc: Add support for async communication
config: arm64-randconfig-r072-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241328.naBWhr1K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603241328.naBWhr1K-lkp@intel.com/

New smatch warnings:
drivers/firmware/stratix10-svc.c:1119 stratix10_svc_add_async_client() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
drivers/firmware/stratix10-svc.c:1256 stratix10_svc_async_send() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?

Old smatch warnings:
drivers/firmware/stratix10-svc.c:1302 stratix10_svc_async_send() warn: inconsistent indenting
drivers/firmware/stratix10-svc.c:1630 stratix10_svc_send() warn: inconsistent indenting

vim +/max +1119 drivers/firmware/stratix10-svc.c

bcb9f4f0706147a Mahesh Rao   2025-10-27  1082  int stratix10_svc_add_async_client(struct stratix10_svc_chan *chan,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1083  				   bool use_unique_clientid)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1084  {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1085  	struct stratix10_svc_controller *ctrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1086  	struct stratix10_async_ctrl *actrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1087  	struct stratix10_async_chan *achan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1088  	int ret = 0;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1089  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1090  	if (!chan)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1091  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1092  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1093  	ctrl = chan->ctrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1094  	actrl = &ctrl->actrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1095  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1096  	if (!actrl->initialized) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1097  		dev_err(ctrl->dev, "Async controller not initialized\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1098  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1099  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1100  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1101  	if (chan->async_chan) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1102  		dev_err(ctrl->dev, "async channel already allocated\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1103  		return -EALREADY;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1104  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1105  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1106  	if (use_unique_clientid &&
bcb9f4f0706147a Mahesh Rao   2025-10-27  1107  	    atomic_read(&actrl->common_achan_refcount) > 0) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1108  		chan->async_chan = actrl->common_async_chan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1109  		atomic_inc(&actrl->common_achan_refcount);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1110  		return 0;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1111  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1112  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1113  	achan = kzalloc(sizeof(*achan), GFP_KERNEL);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1114  	if (!achan)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1115  		return -ENOMEM;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1116  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1117  	ida_init(&achan->job_id_pool);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1118  
bcb9f4f0706147a Mahesh Rao   2025-10-27 @1119  	ret = ida_alloc_max(&actrl->async_id_pool, MAX_SDM_CLIENT_IDS,
                                                                                           ^^^^^^^^^^^^^^^^^^
This should be "MAX_SDM_CLIENT_IDS - 1".

bcb9f4f0706147a Mahesh Rao   2025-10-27  1120  			    GFP_KERNEL);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1121  	if (ret < 0) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1122  		dev_err(ctrl->dev,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1123  			"Failed to allocate async client id\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1124  		ida_destroy(&achan->job_id_pool);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1125  		kfree(achan);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1126  		return ret;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1127  	}

[ snip ]

bcb9f4f0706147a Mahesh Rao   2025-10-27  1223  int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1224  			     void **handler, async_callback_t cb, void *cb_arg)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1225  {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1226  	struct arm_smccc_1_2_regs args = { 0 }, res = { 0 };
bcb9f4f0706147a Mahesh Rao   2025-10-27  1227  	struct stratix10_svc_async_handler *handle = NULL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1228  	struct stratix10_svc_client_msg *p_msg =
bcb9f4f0706147a Mahesh Rao   2025-10-27  1229  		(struct stratix10_svc_client_msg *)msg;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1230  	struct stratix10_svc_controller *ctrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1231  	struct stratix10_async_ctrl *actrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1232  	struct stratix10_async_chan *achan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1233  	int ret = 0;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1234  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1235  	if (!chan || !msg || !handler)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1236  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1237  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1238  	achan = chan->async_chan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1239  	ctrl = chan->ctrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1240  	actrl = &ctrl->actrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1241  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1242  	if (!actrl->initialized) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1243  		dev_err(ctrl->dev, "Async controller not initialized\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1244  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1245  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1246  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1247  	if (!achan) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1248  		dev_err(ctrl->dev, "Async channel not allocated\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1249  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1250  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1251  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1252  	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1253  	if (!handle)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1254  		return -ENOMEM;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1255  
bcb9f4f0706147a Mahesh Rao   2025-10-27 @1256  	ret = ida_alloc_max(&achan->job_id_pool, MAX_SDM_JOB_IDS,
                                                                                        ^^^^^^^^^^^^^^^^^^
"MAX_SDM_CLIENT_IDS - 1" as well.

bcb9f4f0706147a Mahesh Rao   2025-10-27  1257  			    GFP_KERNEL);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1258  	if (ret < 0) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1259  		dev_err(ctrl->dev, "Failed to allocate job id\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1260  		kfree(handle);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1261  		return -ENOMEM;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1262  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1263  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1264  	handle->transaction_id =
bcb9f4f0706147a Mahesh Rao   2025-10-27  1265  		STRATIX10_SET_TRANSACTIONID(achan->async_client_id, ret);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1266  	handle->cb = cb;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1267  	handle->msg = p_msg;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1268  	handle->cb_arg = cb_arg;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1269  	handle->achan = achan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1270  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1271  	/*set the transaction jobid in args.a1*/
bcb9f4f0706147a Mahesh Rao   2025-10-27  1272  	args.a1 =
bcb9f4f0706147a Mahesh Rao   2025-10-27  1273  		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1274  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1275  	switch (p_msg->command) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1276  	default:
bcb9f4f0706147a Mahesh Rao   2025-10-27  1277  		dev_err(ctrl->dev, "Invalid command ,%d\n", p_msg->command);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1278  		ret = -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1279  		goto deallocate_id;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1280  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1281  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1282  	/**
bcb9f4f0706147a Mahesh Rao   2025-10-27  1283  	 * There is a chance that during the execution of async_send()
bcb9f4f0706147a Mahesh Rao   2025-10-27  1284  	 * in one core, an interrupt might be received in another core;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1285  	 * to mitigate this we are adding the handle to the DB and then
bcb9f4f0706147a Mahesh Rao   2025-10-27  1286  	 * send the smc call. If the smc call is rejected or busy then
bcb9f4f0706147a Mahesh Rao   2025-10-27  1287  	 * we will deallocate the handle for the client to retry again.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1288  	 */
bcb9f4f0706147a Mahesh Rao   2025-10-27  1289  	scoped_guard(spinlock_bh, &actrl->trx_list_lock) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1290  		hash_add(actrl->trx_list, &handle->next,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1291  			 handle->transaction_id);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1292  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1293  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1294  	actrl->invoke_fn(actrl, &args, &res);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1295  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1296  	switch (res.a0) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1297  	case INTEL_SIP_SMC_STATUS_OK:
bcb9f4f0706147a Mahesh Rao   2025-10-27  1298  		dev_dbg(ctrl->dev,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1299  			"Async message sent with transaction_id 0x%02x\n",
bcb9f4f0706147a Mahesh Rao   2025-10-27  1300  			handle->transaction_id);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1301  			*handler = handle;
                                                                ^^^^^^^^^^^^^^^^^^
This line is indented one tab too far.

bcb9f4f0706147a Mahesh Rao   2025-10-27  1302  		return 0;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1303  	case INTEL_SIP_SMC_STATUS_BUSY:
bcb9f4f0706147a Mahesh Rao   2025-10-27  1304  		dev_warn(ctrl->dev, "Mailbox is busy, try after some time\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1305  		ret = -EAGAIN;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1306  		break;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1307  	case INTEL_SIP_SMC_STATUS_REJECTED:
bcb9f4f0706147a Mahesh Rao   2025-10-27  1308  		dev_err(ctrl->dev, "Async message rejected\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1309  		ret = -EBADF;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


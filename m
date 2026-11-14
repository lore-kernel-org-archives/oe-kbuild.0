Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677304;
	b=UBwPtuzw70CUoCQVjWQ3/VwnxBQ3g5G06uzLU+yBL1CvZMC6vs0s6fbeNYj3ZH47Ipgx
	 QYCODBxPizDOpLRI38nO1JCgFDYsfQ5JoR592b/AUjvKgmSI623LLxz6o/dulU4vY3lL4
	 Z90CoDxCrAWes9O7BaLLupZH2vZVngTs8w27QS5T7iMr/hqPUp8Ss5NBI5KlpiMPAU3Bl
	 T361NxVYGf3CVJW8eHmwLpTYFKgtYC9vv9wOvZavhClSh7MyLql7dli7obIkt0RljLQBs
	 NgRVDgTke2PMFn+LPyIbWNcwlkS0fh9/g96TiHIVpgigx2hcTlrJyrUKBo7XuLG3goQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:tree:
	 head:commit:config:compiler:smatch;
	bh=IdWPTxgUsn9qxutx2bEPW2TAceqmGquTDsM/zJfzVwU=;
	b=lviUbwZpa3mbriyUdKRm6jR4Z8CVJRDbsDJRuSxZXkNfNExgA69KmrQj5Hwwv1glCcyk
	 QCcR1q5v9T6uoijNqXXpcxSHYcV/gM2HlQpI8ysRVDoGQeCDmkbwL1GeCpyBzQtHfeeJ9
	 t/XT2Tntkjw1mSDv34iJwuVqcaxfV7K+kLZ/LF5+5+mW2AE9ruLfWaX2DBmLvXxANEVbz
	 xQSRY7UsLACmqoX59g6zJKLDq00iM7V7eNNokcYM6apPwgkGq2ecJIfSR2HN3U7yp+wN1
	 cBBX9jH48StDlgUHS2V6FwDYxeyC/NOSA7HsWHfpbqDqR0d1TojDMHL7952OnM+aQuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGzpJyNi;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D54606A32E
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 17:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D54606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGzpJyNi
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so2595165e9.3
        for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 09:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677302; x=1795282102; darn=lists.linux.dev;
        h=smatch:compiler:config:commit:head:tree:content-disposition
         :content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IdWPTxgUsn9qxutx2bEPW2TAceqmGquTDsM/zJfzVwU=;
        b=TGzpJyNihBBhICc/W7WZlRewk27t48N5Y4oPFMZEsq1avkVKTfYVBhYrHaymp3JpPu
         bRukyjiCaRVdj7wJLOJ0PAub5L2EYOxYQ1gQQchufzlRorm2B8Od2Hj79LMkVVOCwH4v
         3mH8T1g7016iJGyXPheWyBLbdnkCoMt7A3UFFZ/z4DsLB6ga26gKhUZmCkOybVndx8JF
         7YugO5YJshGbkSLLauFpAPhuiacfJ4u0x29b/+fCUtLJ31mOLGcqKpac3FrvHluQhWd+
         xRjqzSixXfpc6qEfQXi461aBgPB2G9zIPxakFn/29fLTAtel3+sq8VZ9/wEuFfzwaKoV
         M3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677302; x=1795282102;
        h=smatch:compiler:config:commit:head:tree:content-disposition
         :content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IdWPTxgUsn9qxutx2bEPW2TAceqmGquTDsM/zJfzVwU=;
        b=dCy4Y7fs9PRqvxuEFDjelVgIuIbvYvbMbNMUA9X5j7Q5w4fMqLt7ecn8z6JXZnOSrz
         S2e8tK2RwWUW/hE9WZPhcI9WvR45q9QKFdgnIxA5owUgeCLWazHQieUgqajrMb7eo8JQ
         D0EFWbZq63w47CIIvTiZGfsharQY82QLZ7Nviqus04LirCRGWbv/6QWgTDvxm+n9+7TU
         Zgd8dwN3d/IDP2JoT+j0IREgGiRXybfVyt99lb+AI0bVUNVkkVBDRJKNI+oc5i0/G0n4
         AGvxgLcfg/POxRMUok9k6PZEcXT9nijjOaI5ijxZCLTl9crb6Upb4k+4W43Oi89d2jme
         o/tA==
X-Gm-Message-State: APuU4Z8OitBsv4ZhFNx3GwKW8fI9CP4q+GHQqcR1iYS7jXjXnKI69WWC
	vf+P0PMG3+P5X83T/esQbssj/zQa+sU635VRvvIODTxU4oLU1BOK3kwqXZGuyMWiYA5WhwEz
X-Gm-Gg: AYBFou2ovyh2Rh+rOy9svh9+Ws8NV1E0GWEaQI/aQsuACS9aJdJioMBzcs3M3ihbGvk
	9EKbGSB2bAK7bl6mRG20cHslkXzLPqJvNkTC4Jm0b0POMWN5OMEbbDtp/dRPoNuSlJOim7/cfC3
	byANwsRIeyGAeoSWogMl5dm8WZ7ddiW9tS1pFi1rmPRMH8llTzyVR9wqV+jrosaAzWl4p7h1eBh
	bICYphc8uAUEtsb/JuzUTtj9/RKNDyYSfi/EoxXWRIqVP48Eu40FFfjbA6M6kD1mmsCqipsNlnW
	Ng2AOkN5mykhmrPATC8e4Dsa+eApJbT9mJjT5Sc4osTMMTjJCFU7EQXC8KztduVSn7zQIhv4KHH
	qH118c0ZGAxccy+HhDzsfz/uH8mohKHSfg7HEVCeOqSCfSAD5RZ6z0rlbq8E6n9GU0Q2PpzmsvJ
	+vVOM1tZcz216mpxKIvRRFNEuK7CUt8gHHbAApWX1BvVbGt5m1uE8P6p/geIq4n218BeD2ukKQW
	NBUkD4LBQCtDnZt+HMlglCb9zj1TdOZCrqn2nqiEqKTcfcg8yQTW9gCO5c2fyaNPK7kIFC4asEp
	GbCfw9qbOyNSAhYus1JH3ImA4fC3zrOrXHqnMKwkOzWlg6w9qvAbUk0oys5gx+wt20MupxWvho3
	RCdMOoxZtv3LLWt5kZ5C1/4GmGjykAlhSaTOABLcFi1oFPh8v5G04B8r+Pi5sQ5VW18PoRq472B
	4C9G7XOe02rg1p
X-Received: by 2002:a05:600c:1989:b0:4bb:665c:a078 with SMTP id 5b1f17b1804b1-4bb665ca43amr39004545e9.28.1794677301948;
        Sat, 14 Nov 2026 09:28:21 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm10785232f8f.27.2026.11.14.09.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:28:21 -0800 (PST)
Date: Sat, 14 Nov 2026 20:28:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 1/1]
 drivers/usb/gadget/function/f_hid.c:1276 hidg_bind() warn: missing error
 code 'status'
Message-ID: <202611141744.L7RBYVUc-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
tree: https://android.googlesource.com/kernel/common android16-6.12
head: 793c58ba801e0ec6ed0c3b71d1a1f091a42d299c
commit: c6c0d13db5d0f8d465eabc14bd23d2b6a7247a43 [1/1] usb: gadget: f_hid:
 don't call cdev_init while cdev in use
config: arm-randconfig-2200-20261113
 (https://download.01.org/0day-ci/archive/20261114/202611141744.L7RBYVUc-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project
 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb
Message-ID: <20261114172817.9KYrhhD6XH6LPAs5jW8GwFZvLmhcbgP4XEZPai4rk3U@z>

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611141744.L7RBYVUc-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/f_hid.c:1276 hidg_bind() warn: missing error code 'status'

vim +/status +1276 drivers/usb/gadget/function/f_hid.c

d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1243  	if (hidg->use_out_ep)
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1244  		status = usb_assign_descriptors(f,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1245  			hidg_fs_descriptors_intout,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1246  			hidg_hs_descriptors_intout,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1247  			hidg_ss_descriptors_intout,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1248  			hidg_ss_descriptors_intout);
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1249  	else
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1250  		status = usb_assign_descriptors(f,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1251  			hidg_fs_descriptors_ssreport,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1252  			hidg_hs_descriptors_ssreport,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1253  			hidg_ss_descriptors_ssreport,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1254  			hidg_ss_descriptors_ssreport);
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1255  
10287baec761d3 drivers/usb/gadget/f_hid.c          Sebastian Andrzej Siewior 2012-10-22  1256  	if (status)
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1257  		goto fail;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1258  
749494b6bdbbaf drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2017-01-24  1259  	hidg->write_pending = 1;
749494b6bdbbaf drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2017-01-24  1260  	hidg->req = NULL;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1261  
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1262  	INIT_WORK(&hidg->work, get_report_workqueue_handler);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1263  	hidg->workqueue = alloc_workqueue("report_work",
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1264  					  WQ_FREEZABLE |
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1265  					  WQ_MEM_RECLAIM,
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1266  					  1);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1267  
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1268  	if (!hidg->workqueue) {
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1269  		status = -ENOMEM;
0ab3ae768c4847 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1270  		goto fail_free_descs;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1271  	}
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1272  
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1273  	/* create char device */
c6c0d13db5d0f8 drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1274  	hidg->cdev = cdev_alloc();
c6c0d13db5d0f8 drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1275  	if (!hidg->cdev)
c6c0d13db5d0f8 drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27 @1276  		goto fail_free_all;

Missing error code.

c6c0d13db5d0f8 drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1277  	hidg->cdev->ops = &f_hidg_fops;
c6c0d13db5d0f8 drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1278  
c6c0d13db5d0f8 drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1279  	status = cdev_device_add(hidg->cdev, &hidg->dev);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1280  	if (status)
0ab3ae768c4847 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1281  		goto fail_free_all;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1282  
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1283  	return 0;
0ab3ae768c4847 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1284  fail_free_all:
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1285  	destroy_workqueue(hidg->workqueue);
0ab3ae768c4847 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1286  fail_free_descs:
d12a8727171c77 drivers/usb/gadget/function/f_hid.c Pavitrakumar Managutte    2014-10-22  1287  	usb_free_all_descriptors(f);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1288  fail:
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1289  	ERROR(f->config->cdev, "hidg_bind FAILED\n");
14794d7133d0f1 drivers/usb/gadget/function/f_hid.c Felipe F. Tonello         2016-08-23  1290  	if (hidg->req != NULL)
14794d7133d0f1 drivers/usb/gadget/function/f_hid.c Felipe F. Tonello         2016-08-23  1291  		free_ep_req(hidg->in_ep, hidg->req);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1292  
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1293  	usb_ep_free_request(c->cdev->gadget->ep0, hidg->get_req);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1294  	hidg->get_req = NULL;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1295  
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1296  	return status;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1297  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


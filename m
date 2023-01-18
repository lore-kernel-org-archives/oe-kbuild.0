Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461C67B;
	Wed, 18 Jan 2023 08:56:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b5so12004486wrn.0;
        Wed, 18 Jan 2023 00:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6thtDXo/c9qioOo8Qi/PbYnayxyGT0iwys8y7O34oQ=;
        b=FmpZxBt/dh4AFFfH3R1Tl6XC5Gq14n4Cz3zP6EgWdiUwl4+4Hwqe3NRZnEBJokyly+
         bM6lu/DGwkhyJT6sOpC8iiOCwHAi4WuZ0Ejj4UFmZHwgoWGJTuazVTfOeGKCVEirIZu3
         qpLYoM1QxeYWy3UqAvOg+zg4JEDS68TLpVgAaYe0EekYgjUV66gV/9jSa6AQTbFbiqsE
         qwZ8l4SjN4mPigiL+OzPU/G+rqhAw45y44ctlNQ3oxG1kJmP47K/y8GkVnvD43KAYGfG
         4zoNN8A2E5q4dOprXRgfxSqkr0AVKoD3SaTAYgJF/ZIsWf+wig3adJFC5aGqsF1FEker
         0sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j6thtDXo/c9qioOo8Qi/PbYnayxyGT0iwys8y7O34oQ=;
        b=iAmqOAwqjDU1SrV0Mve/A/mXnGo+yyT2BaIr060J2ln2MeJQK7fWitWAhMQlN6V+ff
         YiWtE1SjRRKhvjyN5xcFm66uvNb7k/DxZnvRnmhxkWAR9uXomxu8de6yG93yt9A9f5Cn
         qzSYslaIiVDERWQZdIqBn9RhOKxEIqUGuz6yDziorCn3WRW7ixW80s5RNFXimbrYqo14
         6Wyu/7pS3NzJyfojK0uu4N/jx9ibi/burPkWqEZ4d0opvCm0ImiEaprJVht1rXr545l8
         +yO5yBuQKxX2JvUU3TMixKKNG1sDQuRxfipjzI5aTXs5jL5qUzaQ1+B6Utbmp/XduUm7
         /zkw==
X-Gm-Message-State: AFqh2kqj26zegDfYRFnH1r9DKxz2vZsRbOjgJlfrDC9E2t2GUSEBz6b7
	Hr4YQ/L9p3q/slsNJULs4AxX21lOtSdCvA==
X-Google-Smtp-Source: AMrXdXuKudact6jT8QLXi09z8aD7WHK7cErI/I+kJ6ABFteuwAv3CNFicbccZneMabCg5M10JidnSg==
X-Received: by 2002:a5d:6910:0:b0:242:63e5:2451 with SMTP id t16-20020a5d6910000000b0024263e52451mr11882164wru.71.1674032164211;
        Wed, 18 Jan 2023 00:56:04 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id by12-20020a056000098c00b002bdd8f12effsm15420901wrb.30.2023.01.18.00.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:56:03 -0800 (PST)
Date: Wed, 18 Jan 2023 11:55:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kalle Valo <quic_kvalo@quicinc.com>
Subject: drivers/net/wireless/ath/ath11k/core.c:1309
 ath11k_core_qmi_firmware_ready() warn: missing unwind goto?
Message-ID: <202301181635.nx79BWwh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230118085554.Wd52SJiabMIWynxuHzXUxUKgWxmXUT_3n5vf2FJViOc@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: 33b67a4b4e64275b6f2cbc4318f1596c70659111 ath11k: Update WBM idle ring HP after FW mode on
config: microblaze-randconfig-m041-20230116
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/net/wireless/ath/ath11k/core.c:1309 ath11k_core_qmi_firmware_ready() warn: missing unwind goto?

vim +1309 drivers/net/wireless/ath/ath11k/core.c

d5c65159f28953 Kalle Valo                2019-11-23  1276  int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
d5c65159f28953 Kalle Valo                2019-11-23  1277  {
d5c65159f28953 Kalle Valo                2019-11-23  1278  	int ret;
d5c65159f28953 Kalle Valo                2019-11-23  1279  
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1280  	ret = ath11k_core_start_firmware(ab, ATH11K_FIRMWARE_MODE_NORMAL);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1281  	if (ret) {
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1282  		ath11k_err(ab, "failed to start firmware: %d\n", ret);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1283  		return ret;
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1284  	}
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1285  
d5c65159f28953 Kalle Valo                2019-11-23  1286  	ret = ath11k_ce_init_pipes(ab);
d5c65159f28953 Kalle Valo                2019-11-23  1287  	if (ret) {
d5c65159f28953 Kalle Valo                2019-11-23  1288  		ath11k_err(ab, "failed to initialize CE: %d\n", ret);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1289  		goto err_firmware_stop;
d5c65159f28953 Kalle Valo                2019-11-23  1290  	}
d5c65159f28953 Kalle Valo                2019-11-23  1291  
d5c65159f28953 Kalle Valo                2019-11-23  1292  	ret = ath11k_dp_alloc(ab);
d5c65159f28953 Kalle Valo                2019-11-23  1293  	if (ret) {
d5c65159f28953 Kalle Valo                2019-11-23  1294  		ath11k_err(ab, "failed to init DP: %d\n", ret);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1295  		goto err_firmware_stop;
d5c65159f28953 Kalle Valo                2019-11-23  1296  	}
d5c65159f28953 Kalle Valo                2019-11-23  1297  
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1298  	switch (ath11k_crypto_mode) {
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1299  	case ATH11K_CRYPT_MODE_SW:
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1300  		set_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags);
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1301  		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1302  		break;
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1303  	case ATH11K_CRYPT_MODE_HW:
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1304  		clear_bit(ATH11K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags);
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1305  		clear_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1306  		break;
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1307  	default:
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1308  		ath11k_info(ab, "invalid crypto_mode: %d\n", ath11k_crypto_mode);
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08 @1309  		return -EINVAL;

	ret = -EINVAL;
	mutex_lock(&ab->core_lock);
	goto err_dp_free;

I generally like to do the unlock before the goto instead of inside
the cleanup block but I don't know if that's allowed here.

aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1310  	}
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1311  
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1312  	if (ath11k_frame_mode == ATH11K_HW_TXRX_RAW)
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1313  		set_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags);
aa2092a9bab3f8 Venkateswara Naralasetty  2020-09-08  1314  
d5c65159f28953 Kalle Valo                2019-11-23  1315  	mutex_lock(&ab->core_lock);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1316  	ret = ath11k_core_start(ab);
d5c65159f28953 Kalle Valo                2019-11-23  1317  	if (ret) {
d5c65159f28953 Kalle Valo                2019-11-23  1318  		ath11k_err(ab, "failed to start core: %d\n", ret);
d5c65159f28953 Kalle Valo                2019-11-23  1319  		goto err_dp_free;
d5c65159f28953 Kalle Valo                2019-11-23  1320  	}
d5c65159f28953 Kalle Valo                2019-11-23  1321  
d5c65159f28953 Kalle Valo                2019-11-23  1322  	ret = ath11k_core_pdev_create(ab);
d5c65159f28953 Kalle Valo                2019-11-23  1323  	if (ret) {
d5c65159f28953 Kalle Valo                2019-11-23  1324  		ath11k_err(ab, "failed to create pdev core: %d\n", ret);
d5c65159f28953 Kalle Valo                2019-11-23  1325  		goto err_core_stop;
d5c65159f28953 Kalle Valo                2019-11-23  1326  	}
31858805f91ac7 Govind Singh              2020-05-08  1327  	ath11k_hif_irq_enable(ab);
ec038c6127fa77 Wen Gong                  2021-12-20  1328  
ec038c6127fa77 Wen Gong                  2021-12-20  1329  	ret = ath11k_core_rfkill_config(ab);
ec038c6127fa77 Wen Gong                  2021-12-20  1330  	if (ret && ret != -EOPNOTSUPP) {
ec038c6127fa77 Wen Gong                  2021-12-20  1331  		ath11k_err(ab, "failed to config rfkill: %d\n", ret);
ec038c6127fa77 Wen Gong                  2021-12-20  1332  		goto err_core_stop;
ec038c6127fa77 Wen Gong                  2021-12-20  1333  	}
ec038c6127fa77 Wen Gong                  2021-12-20  1334  
d5c65159f28953 Kalle Valo                2019-11-23  1335  	mutex_unlock(&ab->core_lock);
d5c65159f28953 Kalle Valo                2019-11-23  1336  
d5c65159f28953 Kalle Valo                2019-11-23  1337  	return 0;
d5c65159f28953 Kalle Valo                2019-11-23  1338  
d5c65159f28953 Kalle Valo                2019-11-23  1339  err_core_stop:
d5c65159f28953 Kalle Valo                2019-11-23  1340  	ath11k_core_stop(ab);
0366f42640a410 Vasanthakumar Thiagarajan 2019-11-28  1341  	ath11k_mac_destroy(ab);
d5c65159f28953 Kalle Valo                2019-11-23  1342  err_dp_free:
d5c65159f28953 Kalle Valo                2019-11-23  1343  	ath11k_dp_free(ab);
ba47923974fb67 Govindaraj Saminathan     2019-11-27  1344  	mutex_unlock(&ab->core_lock);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1345  err_firmware_stop:
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1346  	ath11k_qmi_firmware_stop(ab);
33b67a4b4e6427 Manikanta Pubbisetty      2022-04-06  1347  
d5c65159f28953 Kalle Valo                2019-11-23  1348  	return ret;
d5c65159f28953 Kalle Valo                2019-11-23  1349  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


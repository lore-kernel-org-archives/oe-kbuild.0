Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84128E3;
	Fri, 18 Nov 2022 08:49:38 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w14so8201289wru.8;
        Fri, 18 Nov 2022 00:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EFf3ARm0nT3jNjeZbLtGtvZ64o3cCUyg4luOmQ6Lb/Y=;
        b=goxpWQCMqoKib0sTZ8LbE8nR/bhF1mqHc+Ur/gfUFNauWI9mY1jnAFyTG6AoxiyEW4
         VpYbNydB5H42cuNTROGGTq6WKiLgb8bjLanaI0VrdnsYtfhEBZl6TWtcvwdocPwURNiw
         p/TB2fwcNOQ3ev4K7zqPzeDWcwclFKJNyMFwvp2Iq62fcHue/RBEwOhJcQXmPhNGEihY
         1fNPneFF0rhWkszd68GRPFam236ZO/KMgPFI/0NQ0vFj2QZCFGcQ629aw7spGBU4FORZ
         Fi2veT1rLzaIlm5C3Ug2iCloG7oD6RHJdfE6yVNmAxy59mAjN2ejYTktjYB9IpHbloHk
         c/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EFf3ARm0nT3jNjeZbLtGtvZ64o3cCUyg4luOmQ6Lb/Y=;
        b=L/fWnYL2/xtt775ej5nT9JC/Yl2dEuHHn2Bh529EWwuzLZHl+hIIvhFfu4QFrtBQ7Y
         KzZZZPR52JYmWpW/rxqEFqDfG6pG9h6kgfhUDOhMOOggz8SfJJd3evocAjI54RNnir7Q
         y5iC6PalpZ+PC9NcCohF/IheQtQRJpqa5OGRWTZ9VXNcur92pgEx0P0k3LSd/52MC+L4
         e3AOpv6HHmzD/rUIDXzVfWazmS7BEan/AZCF269BdWqDg/pzLU0CEWJzPXsm3iVJCBYa
         7XNaOtBiDD7Y9ZcJBh2Gt83gwHa7YmeX+TRhGKoltaifUUNkw18s9WPthhrl3n86x2BQ
         8xmw==
X-Gm-Message-State: ANoB5pnuZiFhDilQPN5i3jaPUFxFzllTpmiTtL+bczrDbImLylhdDAfd
	fDNIRtL3nRn5hDNcFfaF5nHg3G7u6zzH8g==
X-Google-Smtp-Source: AA0mqf7t9kNJbwFnu86aNf9/TTboDHFL6r+wAW/CljoO8KJqh82cMMSnmIdKuZwBDR5GXLBSlVqWHA==
X-Received: by 2002:a5d:68d2:0:b0:236:8a6d:e4f2 with SMTP id p18-20020a5d68d2000000b002368a6de4f2mr3835101wrw.271.1668761376094;
        Fri, 18 Nov 2022 00:49:36 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d60cb000000b00241bc4880fesm2304200wrt.111.2022.11.18.00.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 00:49:35 -0800 (PST)
Date: Fri, 18 Nov 2022 11:49:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 65/84]
 drivers/char/tpm/tpm_tis_i2c_cr50.c:763 tpm_cr50_i2c_probe() error:
 uninitialized symbol 'rc'.
Message-ID: <202211181503.XWBTmFt9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221118084933.920SZAS5eZBEEQpenzNraIb8CvFDmqvhEqi7NuTMEuE@z>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   675b4fa09388811028b668cef22747175b6ef900
commit: 44ebfceb7220e89896fefe82a8b1237e46c51c6a [65/84] BACKPORT: FROMLIST: char: tpm: cr50: Use generic request/relinquish locality ops
config: x86_64-randconfig-m001
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/char/tpm/tpm_tis_i2c_cr50.c:763 tpm_cr50_i2c_probe() error: uninitialized symbol 'rc'.

vim +/rc +763 drivers/char/tpm/tpm_tis_i2c_cr50.c

6824f8554a98cba Adrian Ratiu  2021-07-27  709  static int tpm_cr50_i2c_probe(struct i2c_client *client)
3a253caaad11cf4 Duncan Laurie 2020-12-07  710  {
3a253caaad11cf4 Duncan Laurie 2020-12-07  711  	struct tpm_i2c_cr50_priv_data *priv;
3a253caaad11cf4 Duncan Laurie 2020-12-07  712  	struct device *dev = &client->dev;
3a253caaad11cf4 Duncan Laurie 2020-12-07  713  	struct tpm_chip *chip;
3a253caaad11cf4 Duncan Laurie 2020-12-07  714  	u32 vendor;
3a253caaad11cf4 Duncan Laurie 2020-12-07  715  	u8 buf[4];
3a253caaad11cf4 Duncan Laurie 2020-12-07  716  	int rc;
44ebfceb7220e89 Jan Dabros    2022-11-03  717  	int loc;
3a253caaad11cf4 Duncan Laurie 2020-12-07  718  
3a253caaad11cf4 Duncan Laurie 2020-12-07  719  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
3a253caaad11cf4 Duncan Laurie 2020-12-07  720  		return -ENODEV;
3a253caaad11cf4 Duncan Laurie 2020-12-07  721  
3a253caaad11cf4 Duncan Laurie 2020-12-07  722  	chip = tpmm_chip_alloc(dev, &cr50_i2c);
3a253caaad11cf4 Duncan Laurie 2020-12-07  723  	if (IS_ERR(chip))
3a253caaad11cf4 Duncan Laurie 2020-12-07  724  		return PTR_ERR(chip);
3a253caaad11cf4 Duncan Laurie 2020-12-07  725  
3a253caaad11cf4 Duncan Laurie 2020-12-07  726  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
3a253caaad11cf4 Duncan Laurie 2020-12-07  727  	if (!priv)
3a253caaad11cf4 Duncan Laurie 2020-12-07  728  		return -ENOMEM;
3a253caaad11cf4 Duncan Laurie 2020-12-07  729  
3a253caaad11cf4 Duncan Laurie 2020-12-07  730  	/* cr50 is a TPM 2.0 chip */
3a253caaad11cf4 Duncan Laurie 2020-12-07  731  	chip->flags |= TPM_CHIP_FLAG_TPM2;
47fe54939e1e548 Rob Barnes    2021-12-06  732  	if (tpm_cr50_i2c_is_firmware_power_managed(dev))
3a253caaad11cf4 Duncan Laurie 2020-12-07  733  		chip->flags |= TPM_CHIP_FLAG_FIRMWARE_POWER_MANAGED;
3a253caaad11cf4 Duncan Laurie 2020-12-07  734  
3a253caaad11cf4 Duncan Laurie 2020-12-07  735  	/* Default timeouts */
3a253caaad11cf4 Duncan Laurie 2020-12-07  736  	chip->timeout_a = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
3a253caaad11cf4 Duncan Laurie 2020-12-07  737  	chip->timeout_b = msecs_to_jiffies(TIS_LONG_TIMEOUT);
3a253caaad11cf4 Duncan Laurie 2020-12-07  738  	chip->timeout_c = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
3a253caaad11cf4 Duncan Laurie 2020-12-07  739  	chip->timeout_d = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
3a253caaad11cf4 Duncan Laurie 2020-12-07  740  
3a253caaad11cf4 Duncan Laurie 2020-12-07  741  	dev_set_drvdata(&chip->dev, priv);
3a253caaad11cf4 Duncan Laurie 2020-12-07  742  	init_completion(&priv->tpm_ready);
3a253caaad11cf4 Duncan Laurie 2020-12-07  743  
3a253caaad11cf4 Duncan Laurie 2020-12-07  744  	if (client->irq > 0) {
3a253caaad11cf4 Duncan Laurie 2020-12-07  745  		rc = devm_request_irq(dev, client->irq, tpm_cr50_i2c_int_handler,
446cd6f0f3045dd Tian Tao      2021-05-17  746  				      IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
446cd6f0f3045dd Tian Tao      2021-05-17  747  				      IRQF_NO_AUTOEN,
3a253caaad11cf4 Duncan Laurie 2020-12-07  748  				      dev->driver->name, chip);
3a253caaad11cf4 Duncan Laurie 2020-12-07  749  		if (rc < 0) {
3a253caaad11cf4 Duncan Laurie 2020-12-07  750  			dev_err(dev, "Failed to probe IRQ %d\n", client->irq);
3a253caaad11cf4 Duncan Laurie 2020-12-07  751  			return rc;
3a253caaad11cf4 Duncan Laurie 2020-12-07  752  		}
3a253caaad11cf4 Duncan Laurie 2020-12-07  753  
3a253caaad11cf4 Duncan Laurie 2020-12-07  754  		priv->irq = client->irq;
3a253caaad11cf4 Duncan Laurie 2020-12-07  755  	} else {
3a253caaad11cf4 Duncan Laurie 2020-12-07  756  		dev_warn(dev, "No IRQ, will use %ums delay for TPM ready\n",
3a253caaad11cf4 Duncan Laurie 2020-12-07  757  			 TPM_CR50_TIMEOUT_NOIRQ_MS);
3a253caaad11cf4 Duncan Laurie 2020-12-07  758  	}
3a253caaad11cf4 Duncan Laurie 2020-12-07  759  
44ebfceb7220e89 Jan Dabros    2022-11-03  760  	loc = tpm_cr50_request_locality(chip, TPM_CR50_I2C_DEFAULT_LOC);
44ebfceb7220e89 Jan Dabros    2022-11-03  761  	if (loc < 0) {
3a253caaad11cf4 Duncan Laurie 2020-12-07  762  		dev_err(dev, "Could not request locality\n");
3a253caaad11cf4 Duncan Laurie 2020-12-07 @763  		return rc;

return loc;

3a253caaad11cf4 Duncan Laurie 2020-12-07  764  	}
3a253caaad11cf4 Duncan Laurie 2020-12-07  765  
3a253caaad11cf4 Duncan Laurie 2020-12-07  766  	/* Read four bytes from DID_VID register */
44ebfceb7220e89 Jan Dabros    2022-11-03  767  	rc = tpm_cr50_i2c_read(chip, TPM_I2C_DID_VID(loc), buf, sizeof(buf));
3a253caaad11cf4 Duncan Laurie 2020-12-07  768  	if (rc < 0) {
3a253caaad11cf4 Duncan Laurie 2020-12-07  769  		dev_err(dev, "Could not read vendor id\n");
44ebfceb7220e89 Jan Dabros    2022-11-03  770  		if (tpm_cr50_release_locality(chip, loc))
44ebfceb7220e89 Jan Dabros    2022-11-03  771  			dev_err(dev, "Could not release locality\n");
44ebfceb7220e89 Jan Dabros    2022-11-03  772  		return rc;
44ebfceb7220e89 Jan Dabros    2022-11-03  773  	}

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40531EEF9
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736152379; cv=none; b=FlK5JnMZvE4fwwj8gj/f9BWnl//pootear87CzBiQSLqY4ZN31K2v+rpwwu4sLloZtRsFSh2UB9EDUZCY4a0p+ht63IOf8dTJZl/dQxGFfkgQzxFVt/D3VE6Z0/nCglAcVTzU1FyfHRGLlyyMUl6smE8zvUlp+uBBf3TGTjFgiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736152379; c=relaxed/simple;
	bh=WCtZWEzmTF4f21pSZfNXJYvhHTcF7SQ/jbcrALzDGsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eBaAUmkuqt5XnqmT4bQNf2HdS0Rx4k4sJiZ5JjxO89r/cjE3x4+xktN6Hazp73lJIWh6q1oXKBgBLkj5IiAiUWNDCYSUnIfGGvxrT3iErnMLjxz2xL+/K6kigR6CMZG+zk6FK9g2v9igcnbNZWxsqjtB4CVgkJc0dSh5ou4rRlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CfH3Criu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CfH3Criu"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862d161947so6685421f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 00:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736152375; x=1736757175; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkaOiwNyTO0MIQqjxZHiYRLxcWbq5F19IgQTE5vXkmg=;
        b=CfH3CriuEFfVEUFVH0jFhwuXso0U7Vuq8P+ay4Ft1MI+u9nl4mjD4z78WKyMHidf39
         fgZfbtYM6gvdp3T12X3YvoaBWYDUR2V2+p09vEdLpZF4IqosDCLwaDAAbRlO8uZmcgmF
         BTzGygUUYJIWgUGa2twDyFZ7skSmFwW31p65WoRH0mbJOsaOyo5fhjv7hH2NaSrjMQbP
         H7y7qZHpqUKSBTjxpL+uN+m60cHh77Xvc6pJ4JPNnKuPAE0/KMuzirJueH/Qv9cGfejK
         QjKKatqaK/KGV6++eVWallsWRv4tTv/fgo2rnAzGm3m62yfTfhXUpha9avUHURIae1Dv
         bXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736152375; x=1736757175;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkaOiwNyTO0MIQqjxZHiYRLxcWbq5F19IgQTE5vXkmg=;
        b=Gbcaq7wj+GPVoAGtUsHiZEJ7RtVxhkO46X8yna+xrfv+N2zDfvvvEw1gOcNLjtWcfB
         GgwtcURUPYjhd13uMCWH51rFtyaunfwwWhxD6wrRyydNqYIQrPv+KVTH5v18bpmp6da0
         z/8MIXH7+WU8DnVfG4L22HsKnbg7bhKkbbKiwXoeWeu1xQ0LmeVUpqDPzU1srwFxvMIu
         PVCxLBjoyTNv0J5ZLtGNHmXMLnr4K4+Kb9wjJJwEJCKSD6XCPzkly5CjmXucQl7b6URG
         BZY2utmC1TFBLNGqbLK3DZJcR6/X58eK7+8hMv99m7mKLWLqNfWfQQI03IAdHvdxvUiy
         KRhA==
X-Gm-Message-State: AOJu0YzkJ3gVWfwtYy3+IlVTHUGaRK01n19Jdn9slr7AJVJa8WLGQnX8
	gqtjCYtZgGjDv0P3HhkWP8l7ciZHtGFCmDyzk/7WUEUHI/E7gzFLeu3+hY2LEYZdj78bLEvR2s2
	+
X-Gm-Gg: ASbGncubNPAQ14sOCA+EhM5W1T/vS5d4XrmmSLpiu/QTX8T9+0omiJUsqZVa3lAmAO5
	jLXlwJ6JxIhk6KbgGQZ8UcZb/+5Oe7FymPspca+77o/C/DvWtn3TMLhEb1mw+kRYiTIAaRx9ayj
	IbOVZa6/L54PZoCeUtIWFUv9i7m7p2x4NF4i4/ICWuyfn/t+5Gp1ydEfcRFf1sCbcPHiE319Wq6
	OtMwuZfpLsvALH9aqTDoceyAqtjwesNjJyXcbAAPsHj5+3C51W5V9hZlgwaPQ==
X-Google-Smtp-Source: AGHT+IFKi5jnpzwvLEeRn3TeR99eNPCnTMJcqsnzl6oPyVxq40XarZo6OPD20jIn8GuabRjxYScpkg==
X-Received: by 2002:a5d:584e:0:b0:385:e8dd:b143 with SMTP id ffacd0b85a97d-38a221eaf78mr52006098f8f.19.1736152375399;
        Mon, 06 Jan 2025 00:32:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4bbsm557833375e9.32.2025.01.06.00.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 00:32:54 -0800 (PST)
Date: Mon, 6 Jan 2025 11:32:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/staging/gpib/ni_usb/ni_usb_gpib.c:837 ni_usb_write() warn:
 inconsistent returns '&ni_priv->addressed_transfer_lock'.
Message-ID: <7683b46c-cc82-4a77-99ba-f26a663802d3@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
config: i386-randconfig-141-20241219 (https://download.01.org/0day-ci/archive/20241220/202412201550.9NCO57Ye-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412201550.9NCO57Ye-lkp@intel.com/

New smatch warnings:
drivers/staging/gpib/ni_usb/ni_usb_gpib.c:837 ni_usb_write() warn: inconsistent returns '&ni_priv->addressed_transfer_lock'.

Old smatch warnings:
drivers/staging/gpib/ni_usb/ni_usb_gpib.c:418 ni_usb_parse_termination_block() warn: was && intended here instead of ||?
drivers/staging/gpib/ni_usb/ni_usb_gpib.c:697 ni_usb_read() warn: passing freed memory 'in_data' (line 693)

vim +837 drivers/staging/gpib/ni_usb/ni_usb_gpib.c

4e127de14fa78b Dave Penkler 2024-09-18  737  static int ni_usb_write(gpib_board_t *board, uint8_t *buffer, size_t length,
4e127de14fa78b Dave Penkler 2024-09-18  738  			int send_eoi, size_t *bytes_written)
4e127de14fa78b Dave Penkler 2024-09-18  739  {
4e127de14fa78b Dave Penkler 2024-09-18  740  	int retval;
4e127de14fa78b Dave Penkler 2024-09-18  741  	struct ni_usb_priv *ni_priv = board->private_data;
4e127de14fa78b Dave Penkler 2024-09-18  742  	u8 *out_data, *in_data;
4e127de14fa78b Dave Penkler 2024-09-18  743  	int out_data_length;
4e127de14fa78b Dave Penkler 2024-09-18  744  	static const int in_data_length = 0x10;
4e127de14fa78b Dave Penkler 2024-09-18  745  	int usb_bytes_written = 0, usb_bytes_read = 0;
4e127de14fa78b Dave Penkler 2024-09-18  746  	int i = 0, j;
4e127de14fa78b Dave Penkler 2024-09-18  747  	int complement_count;
4e127de14fa78b Dave Penkler 2024-09-18  748  	struct ni_usb_status_block status;
4e127de14fa78b Dave Penkler 2024-09-18  749  	static const int max_write_length = 0xffff;
4e127de14fa78b Dave Penkler 2024-09-18  750  
4e127de14fa78b Dave Penkler 2024-09-18  751  	*bytes_written = 0;
4e127de14fa78b Dave Penkler 2024-09-18  752  	if (length > max_write_length) {
4e127de14fa78b Dave Penkler 2024-09-18  753  		length = max_write_length;
4e127de14fa78b Dave Penkler 2024-09-18  754  		send_eoi = 0;
4e127de14fa78b Dave Penkler 2024-09-18  755  		pr_err("%s: write length too long\n", __func__);
4e127de14fa78b Dave Penkler 2024-09-18  756  	}
4e127de14fa78b Dave Penkler 2024-09-18  757  	out_data_length = length + 0x10;
4e127de14fa78b Dave Penkler 2024-09-18  758  	out_data = kmalloc(out_data_length, GFP_KERNEL);
4e127de14fa78b Dave Penkler 2024-09-18  759  	if (!out_data)
4e127de14fa78b Dave Penkler 2024-09-18  760  		return -ENOMEM;
4e127de14fa78b Dave Penkler 2024-09-18  761  	out_data[i++] = 0x0d;
4e127de14fa78b Dave Penkler 2024-09-18  762  	complement_count = length;
4e127de14fa78b Dave Penkler 2024-09-18  763  	complement_count = length - 1;
4e127de14fa78b Dave Penkler 2024-09-18  764  	complement_count = ~complement_count;
4e127de14fa78b Dave Penkler 2024-09-18  765  	out_data[i++] = complement_count & 0xff;
4e127de14fa78b Dave Penkler 2024-09-18  766  	out_data[i++] = (complement_count >> 8) & 0xff;
4e127de14fa78b Dave Penkler 2024-09-18  767  	out_data[i++] = ni_usb_timeout_code(board->usec_timeout);
4e127de14fa78b Dave Penkler 2024-09-18  768  	out_data[i++] = 0x0;
4e127de14fa78b Dave Penkler 2024-09-18  769  	out_data[i++] = 0x0;
4e127de14fa78b Dave Penkler 2024-09-18  770  	if (send_eoi)
4e127de14fa78b Dave Penkler 2024-09-18  771  		out_data[i++] = 0x8;
4e127de14fa78b Dave Penkler 2024-09-18  772  	else
4e127de14fa78b Dave Penkler 2024-09-18  773  		out_data[i++] = 0x0;
4e127de14fa78b Dave Penkler 2024-09-18  774  	out_data[i++] = 0x0;
4e127de14fa78b Dave Penkler 2024-09-18  775  	for (j = 0; j < length; j++)
4e127de14fa78b Dave Penkler 2024-09-18  776  		out_data[i++] = buffer[j];
4e127de14fa78b Dave Penkler 2024-09-18  777  	while (i % 4)	// pad with zeros to 4-byte boundary
4e127de14fa78b Dave Penkler 2024-09-18  778  		out_data[i++] = 0x0;
4e127de14fa78b Dave Penkler 2024-09-18  779  	i += ni_usb_bulk_termination(&out_data[i]);
4e127de14fa78b Dave Penkler 2024-09-18  780  
4e127de14fa78b Dave Penkler 2024-09-18  781  	mutex_lock(&ni_priv->addressed_transfer_lock);
4e127de14fa78b Dave Penkler 2024-09-18  782  
4e127de14fa78b Dave Penkler 2024-09-18  783  	retval = ni_usb_send_bulk_msg(ni_priv, out_data, i, &usb_bytes_written,
4e127de14fa78b Dave Penkler 2024-09-18  784  				      ni_usb_timeout_msecs(board->usec_timeout));
4e127de14fa78b Dave Penkler 2024-09-18  785  	kfree(out_data);
4e127de14fa78b Dave Penkler 2024-09-18  786  	if (retval || usb_bytes_written != i)	{
4e127de14fa78b Dave Penkler 2024-09-18  787  		mutex_unlock(&ni_priv->addressed_transfer_lock);
4e127de14fa78b Dave Penkler 2024-09-18  788  		pr_err("%s: ni_usb_send_bulk_msg returned %i, usb_bytes_written=%i, i=%i\n",
4e127de14fa78b Dave Penkler 2024-09-18  789  		       __func__, retval, usb_bytes_written, i);
4e127de14fa78b Dave Penkler 2024-09-18  790  		return retval;
4e127de14fa78b Dave Penkler 2024-09-18  791  	}
4e127de14fa78b Dave Penkler 2024-09-18  792  
4e127de14fa78b Dave Penkler 2024-09-18  793  	in_data = kmalloc(in_data_length, GFP_KERNEL);
4e127de14fa78b Dave Penkler 2024-09-18  794  	if (!in_data)
4e127de14fa78b Dave Penkler 2024-09-18  795  		return -ENOMEM;

mutex_unlock(&ni_priv->addressed_transfer_lock); before returning.

4e127de14fa78b Dave Penkler 2024-09-18  796  	retval = ni_usb_receive_bulk_msg(ni_priv, in_data, in_data_length, &usb_bytes_read,
4e127de14fa78b Dave Penkler 2024-09-18  797  					 ni_usb_timeout_msecs(board->usec_timeout), 1);
4e127de14fa78b Dave Penkler 2024-09-18  798  
4e127de14fa78b Dave Penkler 2024-09-18  799  	mutex_unlock(&ni_priv->addressed_transfer_lock);
4e127de14fa78b Dave Penkler 2024-09-18  800  
4e127de14fa78b Dave Penkler 2024-09-18  801  	if ((retval && retval != -ERESTARTSYS) || usb_bytes_read != 12) {
4e127de14fa78b Dave Penkler 2024-09-18  802  		pr_err("%s: ni_usb_receive_bulk_msg returned %i, usb_bytes_read=%i\n",
4e127de14fa78b Dave Penkler 2024-09-18  803  		       __func__, retval, usb_bytes_read);
4e127de14fa78b Dave Penkler 2024-09-18  804  		kfree(in_data);
4e127de14fa78b Dave Penkler 2024-09-18  805  		return retval;
4e127de14fa78b Dave Penkler 2024-09-18  806  	}
4e127de14fa78b Dave Penkler 2024-09-18  807  	ni_usb_parse_status_block(in_data, &status);
4e127de14fa78b Dave Penkler 2024-09-18  808  	kfree(in_data);
4e127de14fa78b Dave Penkler 2024-09-18  809  	switch	(status.error_code) {
4e127de14fa78b Dave Penkler 2024-09-18  810  	case NIUSB_NO_ERROR:
4e127de14fa78b Dave Penkler 2024-09-18  811  		retval = 0;
4e127de14fa78b Dave Penkler 2024-09-18  812  		break;
4e127de14fa78b Dave Penkler 2024-09-18  813  	case NIUSB_ABORTED_ERROR:
4e127de14fa78b Dave Penkler 2024-09-18  814  		/* this is expected if ni_usb_receive_bulk_msg got
4e127de14fa78b Dave Penkler 2024-09-18  815  		 * interrupted by a signal and returned -ERESTARTSYS
4e127de14fa78b Dave Penkler 2024-09-18  816  		 */
4e127de14fa78b Dave Penkler 2024-09-18  817  		break;
4e127de14fa78b Dave Penkler 2024-09-18  818  	case NIUSB_ADDRESSING_ERROR:
4e127de14fa78b Dave Penkler 2024-09-18  819  		pr_err("%s: Addressing error retval %d error code=%i\n",
4e127de14fa78b Dave Penkler 2024-09-18  820  		       __func__, retval, status.error_code);
4e127de14fa78b Dave Penkler 2024-09-18  821  		retval = -ENXIO;
4e127de14fa78b Dave Penkler 2024-09-18  822  		break;
4e127de14fa78b Dave Penkler 2024-09-18  823  	case NIUSB_NO_LISTENER_ERROR:
4e127de14fa78b Dave Penkler 2024-09-18  824  		retval = -ECOMM;
4e127de14fa78b Dave Penkler 2024-09-18  825  		break;
4e127de14fa78b Dave Penkler 2024-09-18  826  	case NIUSB_TIMEOUT_ERROR:
4e127de14fa78b Dave Penkler 2024-09-18  827  		retval = -ETIMEDOUT;
4e127de14fa78b Dave Penkler 2024-09-18  828  		break;
4e127de14fa78b Dave Penkler 2024-09-18  829  	default:
4e127de14fa78b Dave Penkler 2024-09-18  830  		pr_err("%s: unknown error code=%i\n",
4e127de14fa78b Dave Penkler 2024-09-18  831  		       __func__, status.error_code);
4e127de14fa78b Dave Penkler 2024-09-18  832  		retval = -EPIPE;
4e127de14fa78b Dave Penkler 2024-09-18  833  		break;
4e127de14fa78b Dave Penkler 2024-09-18  834  	}
4e127de14fa78b Dave Penkler 2024-09-18  835  	ni_usb_soft_update_status(board, status.ibsta, 0);
4e127de14fa78b Dave Penkler 2024-09-18  836  	*bytes_written = length - status.count;
4e127de14fa78b Dave Penkler 2024-09-18 @837  	return retval;
4e127de14fa78b Dave Penkler 2024-09-18  838  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


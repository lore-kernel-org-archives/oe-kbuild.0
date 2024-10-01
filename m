Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED311BCA11
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Oct 2024 07:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766856; cv=none; b=EJLzVFfLwWvCz+VRLiqieOtUy+vFkPLdL1/pvTsAp5ellLPvZLt4NzSBppkO12u1IJlHqA67/YEhznjBh0s7N3NWL+iJQ7HuGdcsOPViUNg4OcvEFHi65lqjGtz4kuwEJ1SVCqanXSTex7r808+/8H6pgncrcA1nlv+sZI08vHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766856; c=relaxed/simple;
	bh=KC6MvMKazf8/h89WgOVTsqzGHOsXqrxVMpn0hHs22kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rUlgmXHPHj+4IasG976dYkpfd1dIuo3YtnRqSLn4HguMoTcEHGuuE6Cu06oEjsp7lb2ZN9v7Zi528QXKtDroKrh8OLBm5rUd0lRJ0fSRj+ApaqQE8tqwLb2fpN1k0GPnmgfcNzOkh/hp2jiNFAG4kijKtlr3eDjP/1zK9C5T/0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BHcVszid; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BHcVszid"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b3e1so2856257a12.2
        for <oe-kbuild@lists.linux.dev>; Tue, 01 Oct 2024 00:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727766852; x=1728371652; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84KdiY6eOwFhNlRitvIT3M7q17eCNoBB49Q3ug9sdZk=;
        b=BHcVsziddagMh5c7wUozfgtvCqwfklCm/gfNgq9Ng8QPb2YJPCkS4O0puvu3Gp8zka
         lJq7ykhKVMdgaHekIetKiCTiUPAcDUku30LRAs/sS5ddIYqJVEt2hh7yo898KBEb5a92
         sebdxMTphufS2jgDRTs/mA1/kHp7RHGwQbsBjp+IAeXYClJC0cBCcyz/nKkQZgDTJZBO
         3MiJDgxzawizCVog13ulKgHverC+pOe7euhS73XhLqkas+BC7ojqVVMZJ2O0zO1KvVjN
         IB25wedno6R5DQvzyhMOeStlHwtw9jgpmKm/kPFE7MTnFTm85ZJrOPpRsqHDaxV5tdZy
         u0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727766852; x=1728371652;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84KdiY6eOwFhNlRitvIT3M7q17eCNoBB49Q3ug9sdZk=;
        b=GHvndDbX+ew/NVt4VV+bS0aTC0QxQHuQdisny25g8wMPh9uV3BqKDFIIkWYcjQOyzQ
         GSOzVbGd+xaqAIOX5fVJtbQNEKGcmi+5xfx4agN+RbSE0YbPBgXmRmet5/GvRK4Tj3tM
         q4jK7NalFXc7SsnreJHhKcl2wRC4E/FAlJY8Z8unz4b9EH3J/KD4C6wGJ0xMZkZWTgfc
         2oNEauFwhhYnwCC3o0Y+EapHxGEdCHhWE0+mkbVZh+cXE1jYDyMVpjQi+q6kVl1dpTKW
         2OePaAbnD2F6PAcgR4faMnCLTPzh2Ijo74T8ac5X1+aG+VjAVtbHd/0uXDb4VMowJxLO
         uNgg==
X-Gm-Message-State: AOJu0YwVH0JVememCLyOK5snhs1nBNX7VwIOOO15enysI5CKJpUjr9BC
	9+vc9BbMb+rIZrrr7DuaT2GnbysT2hM+A93tUNSxr/sUkIYDntg1uogLcoYNb4qKPzcB7FXr8uz
	P
X-Google-Smtp-Source: AGHT+IF9j9vuTNIPm6dNHbB7pMaWfkIGZ3j8SheRJCAkwt6/tqqHa7sm7uHotHPJ8FtDX8iM4AGe5A==
X-Received: by 2002:a05:6402:270a:b0:5c8:8eb3:c1d1 with SMTP id 4fb4d7f45d1cf-5c88eb3c24bmr8043794a12.2.1727766851600;
        Tue, 01 Oct 2024 00:14:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245e9e2sm5646021a12.46.2024.10.01.00.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:14:08 -0700 (PDT)
Date: Tue, 1 Oct 2024 10:14:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Nuno Sa <nuno.sa@analog.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-adp5589-fw-conversion 12/14]
 drivers/input/keyboard/adp5589-keys.c:1305 adp5589_parse_fw() error:
 uninitialized symbol 'rows'.
Message-ID: <94521b75-57a8-40e9-a111-6adf580a0982@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nuno,

First bad commit (maybe != root cause):

tree:   https://github.com/nunojsa/linux b4/dev-adp5589-fw-conversion
head:   d8f775093f32be0f662a6093041d941d372d4830
commit: 24e7ec8595ac25060eb380205b2c57416a01815b [12/14] Input: adp5589-keys: unify adp_constants in info struct
config: i386-randconfig-141-20240930 (https://download.01.org/0day-ci/archive/20241001/202410011150.TMw05gzF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410011150.TMw05gzF-lkp@intel.com/

smatch warnings:
drivers/input/keyboard/adp5589-keys.c:1305 adp5589_parse_fw() error: uninitialized symbol 'rows'.

vim +/rows +1305 drivers/input/keyboard/adp5589-keys.c

b6abc9f63f6e47 Nuno Sa            2024-09-18  1255  static int adp5589_parse_fw(struct adp5589_kpad *kpad)
b6abc9f63f6e47 Nuno Sa            2024-09-18  1256  {
b6abc9f63f6e47 Nuno Sa            2024-09-18  1257  	struct i2c_client *client = kpad->client;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1258  	u32 cols = 0, rows, prop_val;
9d2e173644bb5c Michael Hennerich  2011-05-19  1259  	int error;
9d2e173644bb5c Michael Hennerich  2011-05-19  1260  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1261  	error = device_property_read_u32(&client->dev, "adi,cols-mask",
b6abc9f63f6e47 Nuno Sa            2024-09-18  1262  					 &prop_val);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1263  	if (!error) {
24e7ec8595ac25 Nuno Sa            2024-09-18  1264  		if (prop_val > GENMASK(kpad->info->max_col_num, 0)) {
b6abc9f63f6e47 Nuno Sa            2024-09-18  1265  			dev_err(&client->dev, "Invalid column mask(%x)\n",
b6abc9f63f6e47 Nuno Sa            2024-09-18  1266  				prop_val);
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1267  			return -EINVAL;
9d2e173644bb5c Michael Hennerich  2011-05-19  1268  		}
9d2e173644bb5c Michael Hennerich  2011-05-19  1269  
24e7ec8595ac25 Nuno Sa            2024-09-18  1270  		kpad->keypad_en_mask = prop_val << kpad->info->col_shift;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1271  		/*
b6abc9f63f6e47 Nuno Sa            2024-09-18  1272  		 * Note that given that we get a mask (and the HW allows it), we
b6abc9f63f6e47 Nuno Sa            2024-09-18  1273  		 * can have holes in our keypad (eg: row0, row1 and row7 enabled).
b6abc9f63f6e47 Nuno Sa            2024-09-18  1274  		 * However, for the matrix parsing functions we need to pass the
b6abc9f63f6e47 Nuno Sa            2024-09-18  1275  		 * number of rows/cols as the maximum row/col used plus 1. This
b6abc9f63f6e47 Nuno Sa            2024-09-18  1276  		 * pretty much means we will also have holes in our SW keypad.
b6abc9f63f6e47 Nuno Sa            2024-09-18  1277  		 */
b6abc9f63f6e47 Nuno Sa            2024-09-18  1278  		cols = fls(prop_val);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1279  	}
b6abc9f63f6e47 Nuno Sa            2024-09-18  1280  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1281  	error = device_property_read_u32(&client->dev, "adi,rows-mask",
b6abc9f63f6e47 Nuno Sa            2024-09-18  1282  					 &prop_val);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1283  	if (!error) {
24e7ec8595ac25 Nuno Sa            2024-09-18  1284  		if (prop_val > GENMASK(kpad->info->max_row_num, 0)) {
b6abc9f63f6e47 Nuno Sa            2024-09-18  1285  			dev_err(&client->dev, "Invalid row mask(%x)\n",
b6abc9f63f6e47 Nuno Sa            2024-09-18  1286  				prop_val);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1287  			return -EINVAL;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1288  		}
b6abc9f63f6e47 Nuno Sa            2024-09-18  1289  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1290  		if (prop_val & BIT(5) && !kpad->info->support_row5) {
b6abc9f63f6e47 Nuno Sa            2024-09-18  1291  			dev_err(&client->dev, "Row5 not supported!\n");
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1292  			return -EINVAL;
9d2e173644bb5c Michael Hennerich  2011-05-19  1293  		}
9d2e173644bb5c Michael Hennerich  2011-05-19  1294  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1295  		if (!cols) {
b6abc9f63f6e47 Nuno Sa            2024-09-18  1296  			dev_err(&client->dev, "Cannot have columns with no rows!\n");
cb3efd5a38855e Lars-Peter Clausen 2019-10-23  1297  			return -EINVAL;
9d2e173644bb5c Michael Hennerich  2011-05-19  1298  		}
9d2e173644bb5c Michael Hennerich  2011-05-19  1299  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1300  		kpad->keypad_en_mask |= prop_val;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1301  		rows = fls(prop_val);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1302  	}

rows is uninitialized on else path.

b6abc9f63f6e47 Nuno Sa            2024-09-18  1303  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1304  	if (kpad->keypad_en_mask) {
b6abc9f63f6e47 Nuno Sa            2024-09-18 @1305  		error = matrix_keypad_build_keymap(NULL, NULL, rows, cols,
                                                                                                               ^^^^


b6abc9f63f6e47 Nuno Sa            2024-09-18  1306  						   kpad->keycode, kpad->input);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1307  		if (error)
b6abc9f63f6e47 Nuno Sa            2024-09-18  1308  			return error;
b6abc9f63f6e47 Nuno Sa            2024-09-18  1309  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1310  		kpad->row_shift = get_count_order(cols);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1311  	}
b6abc9f63f6e47 Nuno Sa            2024-09-18  1312  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1313  	if (device_property_present(&client->dev, "autorepeat"))
b6abc9f63f6e47 Nuno Sa            2024-09-18  1314  		__set_bit(EV_REP, kpad->input->evbit);
b6abc9f63f6e47 Nuno Sa            2024-09-18  1315  
b6abc9f63f6e47 Nuno Sa            2024-09-18  1316  	error = device_property_read_u32(&client->dev, "adi,key-poll-ms",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


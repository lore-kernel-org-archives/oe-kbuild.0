Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0247614F9EA
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713792966; cv=none; b=RlGfjStkOBum7WcvjcahNnHcQ6Lr4RSRqUDvKBH7C7x4pO12ilpD901RzRk16vCSsCw4Sk214WWzpGYnIXSNuZq50RA5erVoEe1TzcR8H9sc2ZpWXkGqlaHN0flXuuN7a5rL2o7vtF5/mYuG2ppk6ODY05Y1jvOE6PR5exLcxs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713792966; c=relaxed/simple;
	bh=YJdRcjVkxUm2hwiKXvHvQSOdntNyAMqRQQVJTWBlG0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hlarj9TaQmfwJ14hS+mWoWDPt3Mszgh5Xq3w4ilcZI9L3URGFlvObjpn3MmIm3IbSTk6XxzcrmgF75pwdE/pKTqtbvAKxyw/xe+0K/iZuCq3c+15HZrUSqL1rLsdHbpuD0t+M8d/fkkDls1P9WmISgY0BPaLUPDH99o10WgHLxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HFgJR7Z8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HFgJR7Z8"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a556d22fa93so508660566b.3
        for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713792963; x=1714397763; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWSBEbtUyKmsYH3feM/Nch+OBxtGEyTsJZqQrpl8YWo=;
        b=HFgJR7Z8fzTwTG8f5IpXlriMdybhDiE/psk5pU/Wvxk6/i6tFfbisLnUCUOLSsm9cq
         lHILMrQ7FzOgyqD+l0tpxE1SuNdFTE7auvnQmxBXyCsfgmhqBCpT1QDiy+FHKD6lLhw9
         v6rihw9MhiQzhaBKNT2ftoXmWe/RROVftX1HVRBo7ofC4RZ9TViKk2a47Fc8gzBoX49p
         gCCCeYUqlIQkyEFPeP2gZlpkVScONTSwrWcNu8BhdD6dqoDs5/U/FGSOpN6u7eW5Sfo0
         o3q5uCv50sWo2cLZj3U2iMoVZazy1HrWNZjFk0IbPVxiVIqNZdYQtVzv3PEp3JpTDryv
         Qq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713792963; x=1714397763;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWSBEbtUyKmsYH3feM/Nch+OBxtGEyTsJZqQrpl8YWo=;
        b=unx1Gj73Y9+uZ3UbFQBf1tTEuiJ52ays8qqb+MupWJ4V8aZ5hPybmEoLrqh4T7Iq02
         NB0PRFQMT/jm3xZWA24vG9TKa1yFMOq0shBVj1lgLLIqXJviefo4S0uOBvPJno+r1XvQ
         /vqvtveoPJBn0XKgcN6cKYctEDtwx2ksrnKuxPJ47nmj7SUb0DlaFoZKjjMcKvZj8KYw
         Dd57L6787LMEon4krow3Oecfwv/ivqrryU3FVr17i789ICEE5pHZerFoheWA2gezo86n
         bOjFr7MDkoZE6kAISTBaUeM2M6NFDJJYPnomhDoH8TxnIeXPsGzoPtu9GN4Vk7rq71k6
         bfGQ==
X-Gm-Message-State: AOJu0YyXEFkBjXYynqJPE8rhOnZdaXIQPhoMqmVy1//wJXIyGiKitSJu
	DqMMMC7aXDMozWgvdw8693JB3ws24Et5fCWfe8kVtHwQOQYcHna8KFsLbQq5wtylXM2vHJFKMLa
	i
X-Google-Smtp-Source: AGHT+IEyi83+UvddZK0AHc4vdThzvzr8YdWIp3Yd0y+Fquqndt4qpHgZKeOGZ+CH9jooxgzdySwiDQ==
X-Received: by 2002:a17:906:2806:b0:a55:8820:e8b3 with SMTP id r6-20020a170906280600b00a558820e8b3mr5646437ejc.19.1713792962493;
        Mon, 22 Apr 2024 06:36:02 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906705400b00a555ef55ab5sm5748908ejj.218.2024.04.22.06.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:36:01 -0700 (PDT)
Date: Mon, 22 Apr 2024 16:35:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Geoffrey D. Bennett" <g@b4.vu>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 34/51] sound/usb/mixer_scarlett2.c:3690
 scarlett2_ag_target_ctl_get() error: uninitialized symbol 'err'.
Message-ID: <575ad887-b156-483e-b527-ccadd37bdccf@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   32cb23a0f911317cdb5030035e49a204aa86fef5
commit: e30ea5340c25d41484d551f61d8c93106989019b [34/51] ALSA: scarlett2: Add autogain target controls
config: csky-randconfig-r081-20240420 (https://download.01.org/0day-ci/archive/20240420/202404201509.mWdaL3xF-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404201509.mWdaL3xF-lkp@intel.com/

New smatch warnings:
sound/usb/mixer_scarlett2.c:3690 scarlett2_ag_target_ctl_get() error: uninitialized symbol 'err'.

vim +/err +3690 sound/usb/mixer_scarlett2.c

e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3665  static int scarlett2_ag_target_ctl_get(
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3666  	struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3667  {
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3668  	struct usb_mixer_elem_info *elem = kctl->private_data;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3669  	struct usb_mixer_interface *mixer = elem->head.mixer;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3670  	struct scarlett2_data *private = mixer->private_data;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3671  	int err;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3672  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3673  	mutex_lock(&private->data_mutex);
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3674  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3675  	if (private->hwdep_in_use) {
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3676  		err = -EBUSY;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3677  		goto unlock;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3678  	}
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3679  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3680  	if (private->autogain_updated) {
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3681  		err = scarlett2_update_autogain(mixer);
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3682  		if (err < 0)
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3683  			goto unlock;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3684  	}

err uninitialized on else path.

e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3685  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3686  	ucontrol->value.integer.value[0] = private->ag_targets[elem->control];
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3687  
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3688  unlock:
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3689  	mutex_unlock(&private->data_mutex);
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13 @3690  	return err;
e30ea5340c25d41 Geoffrey D. Bennett 2024-03-13  3691  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


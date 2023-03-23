Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2CA8F6D;
	Thu, 23 Mar 2023 12:41:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id n19so3180642wms.0;
        Thu, 23 Mar 2023 05:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679575314;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZTO1aJRnL1+Oh8p/lVFwqOyrGLD2otO5PNv6g+O/HMY=;
        b=Bh9Fmw5lWoasdsXR1VVpqePwlOwheabyYe4YD1tJeCRXpoA3GOiN63mm+ESVItbBBI
         ylggCgAQA9gui0zDjqpWqbVUPKlUk9TLZljpzIIFW7Xl0lEKOeEvg8Oiad1Z0ZzX8Esu
         1usa6gzb/LrT+7jCFUbKMWgyNMgsXCZuLpfG0ayO3heYkv3TQ+AWywgEONHG0Ymf7ZxM
         JN11eJyBFnVyvBathV8662nbIVW0c4f3pvlWURwgBm3aH8y0YoceDBIVM3pKV5baF3kT
         PV3ghsFYYnPOJuxcW0HLdQ8sa/zLbu9D+l4sY9I7g0L4MKul1k2ndf8pobqdZERgcHeA
         vNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679575314;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTO1aJRnL1+Oh8p/lVFwqOyrGLD2otO5PNv6g+O/HMY=;
        b=EAhrhW4mllPaMeY/thgkdZ2zyaDS+7qO22vcu99Ckj/awHCWSO+7q98F2n/RyWdN5J
         JHVj4n7bjQPcOHwGkoe+o8JouTKc/33xdRtMUHeHoWQsJzptuEw5YRi/aUw8YWb548IN
         RLa0MpAYIBdAN/3Kz1gLCFHhY0nK3PsJPFgBUFzedtCOxJfgpBncrCyrpkb0Azd+t2Pe
         sG4uUgY+cujFqHriHBm6PMi/cO5DFARr/8JlMf52gD85kCW+MVZPvmyytBDTr1GbjC/d
         7cma2d/nMcVAFRqNrYc2xsnwJahEo4HGFON9yQJVkQh5S/L8mRjYUrtpU5bjEsjG95Cc
         Utjg==
X-Gm-Message-State: AO0yUKWgnZ/W23h1MwxGO+jOSiWzEswF+XX7DVL8mpj+2txHPECuYjrg
	wKQXo0PzuYZerD66EJW4pRBDDZMewA8=
X-Google-Smtp-Source: AK7set+Epz7S8rzbMT+hMxCjPF0O+F7IuiDLIgVk4ggW9Q5bx9mAIGcFMSTFsjsCTtMhjf0ZTJIKfw==
X-Received: by 2002:a1c:7412:0:b0:3ee:96f0:ea31 with SMTP id p18-20020a1c7412000000b003ee96f0ea31mr840190wmc.18.1679575314157;
        Thu, 23 Mar 2023 05:41:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k10-20020a7bc30a000000b003eafc47eb09sm1733976wmj.43.2023.03.23.05.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:41:53 -0700 (PDT)
Date: Thu, 23 Mar 2023 15:41:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 26/27]
 drivers/media/v4l2-core/v4l2-ctrls-api.c:157 user_to_new() warn: if
 statement not indented
Message-ID: <5f0004c1-05ae-4e7e-a201-c7fc028c0165@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   0d75c643cb6de73b439e21bae1beab2350753291
commit: 43b2acadebeb69d7317bb321696b9cf5aceb557e [26/27] UPSTREAM: media: v4l2-ctrls-api.c: add back dropped ctrl->is_new = 1
config: nds32-randconfig-m031-20230322 (https://download.01.org/0day-ci/archive/20230323/202303232056.JGQxLz6c-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303232056.JGQxLz6c-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls-api.c:157 user_to_new() warn: if statement not indented
drivers/media/v4l2-core/v4l2-ctrls-api.c:159 user_to_new() warn: inconsistent indenting

vim +157 drivers/media/v4l2-core/v4l2-ctrls-api.c

71c689dc2e732d Hans Verkuil 2021-04-27  138  	switch (ctrl->type) {
71c689dc2e732d Hans Verkuil 2021-04-27  139  	case V4L2_CTRL_TYPE_INTEGER64:
6f9b5b1a63184c Hans Verkuil 2022-07-08  140  		*ctrl->p_new.p_s64 = c->value64;
71c689dc2e732d Hans Verkuil 2021-04-27  141  		break;
71c689dc2e732d Hans Verkuil 2021-04-27  142  	case V4L2_CTRL_TYPE_STRING:
71c689dc2e732d Hans Verkuil 2021-04-27  143  		size = c->size;
71c689dc2e732d Hans Verkuil 2021-04-27  144  		if (size == 0)
71c689dc2e732d Hans Verkuil 2021-04-27  145  			return -ERANGE;
71c689dc2e732d Hans Verkuil 2021-04-27  146  		if (size > ctrl->maximum + 1)
71c689dc2e732d Hans Verkuil 2021-04-27  147  			size = ctrl->maximum + 1;
6f9b5b1a63184c Hans Verkuil 2022-07-08  148  		ret = copy_from_user(ctrl->p_new.p_char, c->string, size) ? -EFAULT : 0;
71c689dc2e732d Hans Verkuil 2021-04-27  149  		if (!ret) {
6f9b5b1a63184c Hans Verkuil 2022-07-08  150  			char last = ctrl->p_new.p_char[size - 1];
71c689dc2e732d Hans Verkuil 2021-04-27  151  
6f9b5b1a63184c Hans Verkuil 2022-07-08  152  			ctrl->p_new.p_char[size - 1] = 0;
71c689dc2e732d Hans Verkuil 2021-04-27  153  			/*
71c689dc2e732d Hans Verkuil 2021-04-27  154  			 * If the string was longer than ctrl->maximum,
71c689dc2e732d Hans Verkuil 2021-04-27  155  			 * then return an error.
71c689dc2e732d Hans Verkuil 2021-04-27  156  			 */
6f9b5b1a63184c Hans Verkuil 2022-07-08 @157  			if (strlen(ctrl->p_new.p_char) == ctrl->maximum && last)
43b2acadebeb69 Hans Verkuil 2022-12-12  158  			ctrl->is_new = 1;
71c689dc2e732d Hans Verkuil 2021-04-27 @159  				return -ERANGE;

Something went wrong here.  Curly braces?  Move the ctrl->is_new = 1;
after the return?

71c689dc2e732d Hans Verkuil 2021-04-27  160  		}
71c689dc2e732d Hans Verkuil 2021-04-27  161  		return ret;
71c689dc2e732d Hans Verkuil 2021-04-27  162  	default:
6f9b5b1a63184c Hans Verkuil 2022-07-08  163  		*ctrl->p_new.p_s32 = c->value;
71c689dc2e732d Hans Verkuil 2021-04-27  164  		break;
71c689dc2e732d Hans Verkuil 2021-04-27  165  	}
6f9b5b1a63184c Hans Verkuil 2022-07-08  166  	ctrl->is_new = 1;
71c689dc2e732d Hans Verkuil 2021-04-27  167  	return 0;
71c689dc2e732d Hans Verkuil 2021-04-27  168  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests


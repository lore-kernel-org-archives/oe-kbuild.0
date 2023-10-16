Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03628480
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Oct 2023 05:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ISotFGLM"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32d81864e3fso3371242f8f.2
        for <oe-kbuild@lists.linux.dev>; Sun, 15 Oct 2023 22:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697434556; x=1698039356; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kE63YcVyoiTF0pqB4vYi6Iwnwu4bq4BVz2G6qBjc2ik=;
        b=ISotFGLMZpXcK4IYmkiFULy/gtS0fltLHmP6aATzTHV/q0hx/rSF+XakgQ908LDeTY
         FThCFt02akrFwIuO01Dvh4kl9NBENpeyQfilSNMHIdhDMm62W7OBf7RaLPDGTTBBebUc
         aiqnPwvB7CyJSdK8rEivmzaRU+OQpeU1/jK6mH4dncRAyOluYGzRqnZ3b6OvUS1MK4uZ
         1ZVY1tQ332jbPqgutcttd6T7yWx7tbx/qWE0Smd2Paezv7ySQ+wO53Arpjp7Tnxh88qq
         8zEIUY9cmfpzF4BYiOYG/ID6meyRG608uKeOfsE9sxa07wRXTYpTU3XcLJHdlu3orKJX
         oVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697434556; x=1698039356;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kE63YcVyoiTF0pqB4vYi6Iwnwu4bq4BVz2G6qBjc2ik=;
        b=hcQ0AaBHFyjaMSj6lydSk1PKEYUEDnHHTyjJga7kF5IpkS31mxXj10vrRPYAxqJ2pG
         Pg2f/+pnKmga6fMfpQyjVYR3lE7hdMZ6LEg3SVjcMur5JM/66A7Av+vzxkrvTi6T8mCI
         0uLxR14IF1Df3xkY6Pq7F7MaU0XsNKJfvxGxG9hj3GrQp7C3a/YPyYlAYVSR5ERmud/x
         hwlxNrIjSfX9CR4DIBcNqEu8XmT8iwKOgIBCysRVTwLJ0TL90eLN8mBaMkdnI8NQ4aGL
         bPzZNKfo5OjappLTzONxrXxzFpA33YeYFK3zy/DW2oh5oAUld52NREWQUzisG3QmG3D+
         VORA==
X-Gm-Message-State: AOJu0YxLVmMEGmfdmUaLuzuRsz1QbWv3H98JuHJZAjKM33krCW9a4sa9
	Og69a+sKpYkusWWOdtGMO3c3sD4yztpFlj/MUxg=
X-Google-Smtp-Source: AGHT+IG+gfj7ziURHjAtkeG9LVfEFA01Y8RlWsKUArIc/ZSAOpI+GWqoXcIKybUrK0Y6yCVrrOCWkw==
X-Received: by 2002:a05:6000:1e17:b0:32d:a98c:aa24 with SMTP id bj23-20020a0560001e1700b0032da98caa24mr3932028wrb.3.1697434555805;
        Sun, 15 Oct 2023 22:35:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bq1-20020a5d5a01000000b0031ad5fb5a0fsm633882wrb.58.2023.10.15.22.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 22:35:55 -0700 (PDT)
Date: Mon, 16 Oct 2023 08:35:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Melanie Lobo <melanie.lobo@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	juha-pekka.heikkila@intel.com
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Support FP16 compressed formats on
 MTL
Message-ID: <04067fb6-64ab-41c5-b063-f3912e880f44@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011102356.22014-1-melanie.lobo@intel.com>

Hi Melanie,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Melanie-Lobo/drm-i915-Support-FP16-compressed-formats-on-MTL/20231011-181214
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231011102356.22014-1-melanie.lobo%40intel.com
patch subject: [Intel-gfx] [PATCH] drm/i915: Support FP16 compressed formats on MTL
config: x86_64-randconfig-161-20231015 (https://download.01.org/0day-ci/archive/20231015/202310150454.S9QF86bl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150454.S9QF86bl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310150454.S9QF86bl-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/skl_universal_plane.c:2126 gen12_plane_format_mod_supported() warn: ignoring unreachable code.

vim +2126 drivers/gpu/drm/i915/display/skl_universal_plane.c

46d12f911821f7 Dave Airlie           2021-02-05  2120  	case DRM_FORMAT_Y210:
46d12f911821f7 Dave Airlie           2021-02-05  2121  	case DRM_FORMAT_Y212:
46d12f911821f7 Dave Airlie           2021-02-05  2122  	case DRM_FORMAT_Y216:
46d12f911821f7 Dave Airlie           2021-02-05  2123  	case DRM_FORMAT_XVYU12_16161616:
46d12f911821f7 Dave Airlie           2021-02-05  2124  	case DRM_FORMAT_XVYU16161616:
46d12f911821f7 Dave Airlie           2021-02-05  2125  		return true;
46d12f911821f7 Dave Airlie           2021-02-05 @2126  		fallthrough;

This fallthrough annotation is incorrect.

46d12f911821f7 Dave Airlie           2021-02-05  2127  	default:
46d12f911821f7 Dave Airlie           2021-02-05  2128  		return false;
46d12f911821f7 Dave Airlie           2021-02-05  2129  	}
46d12f911821f7 Dave Airlie           2021-02-05  2130  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


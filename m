Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B392563;
	Tue,  7 Feb 2023 12:16:34 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso11289471wms.4;
        Tue, 07 Feb 2023 04:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uA/CDQkH17lnUD3TJeDzSy7r9qOsm+dRaC0F5nkTQc4=;
        b=SUWdUT4HZoti1cXGpoLa2yMx/wyzKfd3XRlS40UQnvIKrrVS2vPGxYjAiFIodX/CfZ
         t654yVnYBkMGiKMZJ00Fjhuja7QZs5Kh4YI90g0v6k6/iI0RV3Sw7naIny+SEquzSHql
         o7GUBDSjiIVd5kiDBAOYBv34YQOrSp6iRfrCFomwk5pKLXLaPvfw2SSQ+jkxVAprkg91
         PKlUibeqZrDFNuPoKjiDunSsJQYnGvUAuV8T6RX05EfxtgD/LdP0P35kqFa2DyQrSVGs
         cZX4RdsTbufVuu7CrWTgRKoeO2nm8T4iJaG2o4R1Nyx9RPe/tjUg6lIYCXUKyKqVXiR8
         Jq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uA/CDQkH17lnUD3TJeDzSy7r9qOsm+dRaC0F5nkTQc4=;
        b=k+GcObS8hWW8BDNZljLEnSsddV1jArP2OGoFlWsKWbO3EiBwRmB7WlXWth7a2a3GVJ
         Zr7oImwR1yjOIVtaE56VSmIMsbXV77o+2NOOLnJr/CY0p+11siAbLeX9QvYTnLL3ev3x
         ZaayMJlHR3GwEDTt0BOySbE8afpBDB3iKnUgzauYH8IinSh00Q35tGV3H88lixrH6NSv
         2Agl5X7nheFCh1u2Wz7cU9WXhLUjpBhNiQ3w8VkuUcmXpqDssKEgxUBIKTW9PlbC0TWZ
         itMZxNcTy84zsrtAC5g+9HpjuIq2kmnjCHXzE2iPFa37WKI+DSRPR/prfeFlsCOVNX3+
         lGXw==
X-Gm-Message-State: AO0yUKXTuG4BfpJxBj05uT3wCr+SPb9YqMQT74fLVhoBQG9k8VKNwIoz
	SDhkZUxn9jZjEfNhmnvAE4s=
X-Google-Smtp-Source: AK7set+OWcSQHbxwRE3FCN80dwe4J3zRlEMnDy+SnXDJVcsWJwlZskKp/jqoqtO63rhdWc9fGTj8hA==
X-Received: by 2002:a05:600c:130f:b0:3e0:c5e:ad52 with SMTP id j15-20020a05600c130f00b003e00c5ead52mr3116486wmf.6.1675772192688;
        Tue, 07 Feb 2023 04:16:32 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c4f8600b003daf672a616sm14615568wmq.22.2023.02.07.04.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:16:31 -0800 (PST)
Date: Tue, 7 Feb 2023 15:16:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: sound/soc/soc-topology.c:1405 soc_tplg_dapm_widget_create()
 warn: missing error code 'ret'
Message-ID: <Y+JBHPEN6Qv9wj4Q@kadam>
References: <202302071823.2veEqSHM-lkp@intel.com>
 <c4ca7725-4db1-76d1-ba74-a1d17102bbeb@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4ca7725-4db1-76d1-ba74-a1d17102bbeb@linux.intel.com>

On Tue, Feb 07, 2023 at 12:34:09PM +0100, Amadeusz Sławiński wrote:
> On 2/7/2023 11:08 AM, Dan Carpenter wrote:
> > Hi Amadeusz,
> > 
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
> > commit: 47a1886a610aca6a55c18ee677f9176e73162e97 ASoC: Intel: avs: Enable AVS driver only on x86 platforms
> > config: microblaze-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230207/202302071823.2veEqSHM-lkp@intel.com/config)
> > compiler: microblaze-linux-gcc (GCC) 12.1.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > 
> 
> Oh, I've already noticed this one when doing some cleanups to the file and
> have patch queued internally, but will add above tags and Fixes tag and send
> it upstream separately.
> 
> The issue itself was introduced by commit:
> d29d41e28eea65 "ASoC: topology: Add support for multiple kcontrol types to a
> widget" not by the one it bisected to ;)
> 

That's handled by the Intel team and the kbuild-bot.  However, I wasn't
able to compile the d29d41e28eea65 "ASoC: topology: Add support for ..."
commit because of a build error in other parts of the kernel.  I first
had to apply:

Fixes: 52a9dab6d892 ("libsubcmd: Fix use-after-free for realloc(..., 0)")

So maybe the build breakage messed up git bisect.  Not sure.

regards,
dan carpenter


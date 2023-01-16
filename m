Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842C21852;
	Mon, 16 Jan 2023 09:03:01 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id n7so691086wrx.5;
        Mon, 16 Jan 2023 01:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JJkudWJwNygPc1saqVRch4BZHQ+ehuxSBNJGOWOBYEc=;
        b=b1eH9W1rAzmDTe8ul034A2j9Isfkso8B2RWgb0GkfspkFWMJyjT3Dwdx4TifCn/TBo
         6tUyzNuYsfZSH1+Ugv7TedGMmJkmdhKe92OYed/GHPJxx4F5fGTJ+W+KIfy9uwIfrKq/
         1sXhbKdZrvWTovCZItUWJ/uxb4oyX+3wXJmc5ZK443PXBQbUL+u/Il/cwXi6SW47hTWn
         sgzMugkdlM+jCtSg7BTKsLv3f9S7DszQN4094JDAnVpzc+/bRfwWTqKUglkFL7MwoP49
         MenIoySpwAS7NUsdYUUcAv/+X4veTQDxTWL6HroFryrYcHuAzwfpKPBBMVsFyj2jcssS
         5vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJkudWJwNygPc1saqVRch4BZHQ+ehuxSBNJGOWOBYEc=;
        b=jkFGH2uLEeCc4m5661jCPluHvGisostT9+dAr0uj5/VPTcuVMYdRewQVo5axORBTrb
         XP9rLJOig9ocjFb3NqCNw9nO7T9BL5M4VfdqRa2lKoMHivLNoQ8nxSiWCTuK9D7Zlzf7
         9bdCGZvd88UXsm8QXdtoFcVXCIhfwW38i2NOuAwLYNSFq+HA6SaRSZdxZen7JkxKSv9V
         lxZ8Yi6UpZO5FT7HfAnGp5+Mkk13ixZ3j7JXiAL4dQq+qfggvTWvy8Ko+Q9xQJ2aQOha
         GxMkEb3JTt93KxQ0MmjktUPOJkp6HlJHsoO4aDcPcvNQ5tt1KmEQja7OnYPf97qTDZMb
         KL8w==
X-Gm-Message-State: AFqh2kr2lHojevL5D1+pk1jgvrjO/DRro/zaHBmqBYSuFGdy4wzBYE7M
	9+TiWK6Jk491qNq2fSfnpfE=
X-Google-Smtp-Source: AMrXdXubq8KNmFzoWrAIWnJh9Wd+mZEctZzMEnSPrLhLIiYlWwGuyXD7MHR5PoeAChfEU6c9+BXC0g==
X-Received: by 2002:adf:fbc1:0:b0:242:1415:ab02 with SMTP id d1-20020adffbc1000000b002421415ab02mr51331140wrs.9.1673859779817;
        Mon, 16 Jan 2023 01:02:59 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t13-20020adfe10d000000b002b6bcc0b64dsm13323050wrz.4.2023.01.16.01.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 01:02:59 -0800 (PST)
Date: Mon, 16 Jan 2023 12:02:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Doug Brown <doug@schmorgal.com>
Cc: oe-kbuild@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/8] mmc: sdhci-pxav2: add optional core clock
Message-ID: <Y8USwHNZfuaP1ro8@kadam>
References: <202301140445.zXxR25qN-lkp@intel.com>
 <b5867cb5-aeed-b081-543f-fd611c3c84c9@schmorgal.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5867cb5-aeed-b081-543f-fd611c3c84c9@schmorgal.com>

On Sat, Jan 14, 2023 at 02:49:07PM -0800, Doug Brown wrote:
> Hi Dan,
> 
> On 1/14/2023 12:01 AM, Dan Carpenter wrote:
> > Hi Doug,
> > 
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Doug-Brown/mmc-sdhci-pxav2-add-initial-support-for-PXA168-V1-controller/20230112-102921
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> > patch link:    https://lore.kernel.org/r/20230112022416.8474-6-doug%40schmorgal.com
> > patch subject: [PATCH v4 5/8] mmc: sdhci-pxav2: add optional core clock
> > config: riscv-randconfig-m041-20230113
> > compiler: riscv64-linux-gcc (GCC) 12.1.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > 
> > smatch warnings:
> > drivers/mmc/host/sdhci-pxav2.c:220 sdhci_pxav2_probe() warn: missing error code 'ret'
> 
> Thanks for passing this on. I definitely forgot an assignment to ret.
> Since this is correcting an error in my patch that hasn't been accepted
> yet, is it safe to assume I should omit those Reported-by tags from the
> next version of my patch, since they don't apply to the patch itself?
> 

These emails are from the kbuild team and not from me.  I just look them
over and hit the forward button.  I'm sure it helps the kbuild team in
their marketing when people use the tags...  Right now I'm applying to
jobs outside the Linux community so the tags give me a measurable thing
to say I've helped fix thousands of bugs or whatever...

I've always argued that there should be a different Fixes-from: tag for
people who find bugs during review (as opposed to just complaining about
white space which is its own reward and I do that for free).  So far I
haven't convinced anyone on this though.

Anyway, there isn't a policy one way or the other.  Some people add
them and some don't.  Some people add them below the --- cut off line,
but I don't know if that's deliberate or what the story is there.  That
seems like it might be a good compromise.

regards,
dan carpenter

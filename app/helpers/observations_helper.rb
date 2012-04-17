module ObservationsHelper
  
  def ngcdescription
    ngc_return = ""
    ngc_array = @observation.body.ngc_description.split(';')
    ngc_array.each do |ngcdescription|
      star = false
      ngcdescription.rstrip!
      if ngcdescription.include?("stellar")
        star = true
      end
      case 
      when ngcdescription.match(/lb/)
        ngcdescription.sub!(/lb/, "little bright ")
      when ngcdescription.match(/b/)
        if ngcdescription.include? 'bet'
          ngcdescription.sub!(/bet/, 'between ')
        else if ngcdescription.include? 'neb'
          case 
            when ngcdescription.match(/neby/)
              ngcdescription.sub!(/neby/, 'nebulosity')
            when ngcdescription.match(/nebs/)
              ngcdescription.sub!(/nebs/, 'nebulous')
            else
              ngcdescription.sub!(/neb/, 'nebula')
          end
        else if ngcdescription.include?("psb")
          ngcdescription.sub!(/psb/, "pretty suddenly bright ")
        else if
          ngcdescription.include?("biN")
            ngcdescription.sub!(/biN/, "binuclear")
        else 
          ngcdescription.sub!(/g/, 'gradually ')    
          ngcdescription.sub!(/b/,'brighter ')
        end end end end
      when ngcdescription.match(/c/)
        if ngcdescription.include?("diffic")
            ngcdescription.sub!(/diffic/, 'difficult ')
        else  
          ngcdescription.sub!(/c/,'considerably ')
        end
      when ngcdescription.match(/d/)
        case 
        when ngcdescription.match(/def/)
          ngcdescription.sub!(/def/, 'defined ')
        when ngcdescription.match(/dif/)
          if ngcdescription.include?("dif")
            ngcdescription.sub!(/dif/, 'diffused ')
          end
        when ngcdescription.match(/dist/)
          ngcdescription.sub!(/dist/, 'distance ')
        when ngcdescription.match(/degrees/)
          donothing = 1
        else
          if !ngcdescription.include?("2nd")
            ngcdescription.sub!(/d/,'diameter ')
          end
        end

#      when ngcdescription.match(/f/)
#        ngcdescription.sub!(/f/,'following ')
      when ngcdescription.match(/g/)
        ngcdescription.sub!(/g/,'gradually ')
      when ngcdescription.match(/i/)
        if !ngcdescription.include? 'inv'
          ngcdescription.sub!(/i/,'irregular ')
        end
      when ngcdescription.match(/l/)
        if !ngcdescription.include?("last") && !ngcdescription.include?("stellar")
          ngcdescription.sub!(/l/,'little ')
        end
      when ngcdescription.match(/mE/)
        ngcdescription.sub!(/mE/,'much extended ')
      when ngcdescription.match(/nr/)
        ngcdescription.sub!(/nr/,'near')
      when ngcdescription.match(/p/)
        case 
        when ngcdescription.match(/pF/)
          ngcdescription.sub!(/pF/, 'pretty faint ')
        when ngcdescription.match(/pB/)
          ngcdescription.sub!(/pB/, 'pretty bright ')
        when ngcdescription.match(/pL/)
          ngcdescription.sub!(/pL/, 'pretty large ')
        when ngcdescription.match(/pf/)
          ngcdescription.sub!(/pf/, 'preceding-following ')
        when ngcdescription.match(/pg/)
          ngcdescription.sub!(/pg/, 'pretty gradually ')
        when ngcdescription.match(/pm/)
          ngcdescription.sub!(/pm/, 'pretty much ')
        when ngcdescription.match(/ps/)
          ngcdescription.sub!(/ps/, 'pretty suddenly ')
        when ngcdescription.match(/np/)
          ngcdescription.sub!(/np/, 'north proceding ')
        when ngcdescription.match(/sp/)
          ngcdescription.sub!(/sp/, 'south proceding ')
        when ngcdescription.match(/pS/)
          ngcdescription.sub!(/pS/, 'proceding star ')
          star = true
        else  
          ngcdescription.sub!(/p/,'preceding (westward)')
          star = true
        end
  #    ngcdescription.sub!(/p/,'pretty (before F,B,L,S)')
        
#      when ngcdescription.match(/r/)      
#        ngcdescription.sub!(/r /,'resolvable (mottled,not resolved)')
#      when ngcdescription.match(/s/)
#        ngcdescription.sub!(/s/,'south')
    #    ngcdescription.sub!(/s/,'suddenly (abruptly)')
    end
      if ngcdescription.include?("..") then
        if ngcdescription.rstrip.end_with?("..") then
          ngcdescription.sub!("..", 'th magnatude and dimmer')
        end
      end
      ngcdescription.sub!(/!!!/,'a magnificent ')
      ngcdescription.sub!(/!!/,'v remarkable ')
      ngcdescription.sub!(/!/,'remarkable ')
      ngcdescription.sub!(/\"/,' arc seconds ')
      ngcdescription.sub!(/\'\'/, ' arc seconds ')
      ngcdescription.sub!(/\'/,' arc minutes ')
  #    ngcdescription.sub!(/()/,'items questioned by Dreyer')
      if star == false
 #       if !ngcdescription.include?("last") && !ngcdescription.include?("stellar")
       if !ngcdescription.include?("stellar")
   #     ngcdescription = ngcdescription + "here"
            ngcdescription.sub!(/st/,'stars ')
        end
      end
      ngcdescription.sub!("*10",'a star of 10th magnitude ')
      ngcdescription.sub!("*7-8",'star of magnitude 7 or 8 ')
      ngcdescription.sub!("***",'triple star ')
      ngcdescription.sub!("**",'double star ')
      ngcdescription.sub!("*",'a star ')
    if ngcdescription.include? ".."
      if ngcdescription.end_with? ".."
        ngcdescription.sub!(/\.\./, 'and dimmer ')
      else
        ngcdescription.sub!(/\.\./, 'th to ')
        ngcdescription = ngcdescription.rstrip + "th magnitude "
      end
    end
    if ngcdescription.include? "v"
      contv = false
    if ngcdescription.match(/vF/)
        contv = true
        ngcdescription.sub!(/vF/, 'very faint ')
    end
    if ngcdescription.match(/inv/)
        contv = true
        if ngcdescription.rstrip.ends_with? "inv"
          ngcdescription.sub!(/inv/, 'involed ')
        else 
          ngcdescription.sub!(/inv/, 'involving ')
        end
    end
    if ngcdescription.match(/vf/)
        contv = true
        ngcdescription.sub!(/vf/, 'very faint ')
    end
    if ngcdescription.match(/var/)
        contv = true
        ngcdescription.sub!(/var/, 'variable ')
    end
    if ngcdescription.match(/v/)
        if contv == false
          ngcdescription.gsub!(/v/,'very ')
        end
      end   
    end

      ngcdescription.sub!(/Ab/,'about ')  
      ngcdescription.sub!(/alm/,'almost ')
    
  #    ngcdescription.sub!(/\d../,'magnitude' + '\d' + 'and dimmer')
      
  #    ngcdescription.sub!(/am/,'among')
  #    ngcdescription.sub!(/annul/,'annular or ring nebula')
  #    ngcdescription.sub!(/app/,'appended')
     ngcdescription.sub!(/att/,'attached')
     ngcdescription.sub!(/B/,'bright ')
  #    ngcdescription.sub!(/bf/,'brightest towards the following side')
  #    ngcdescription.sub!(/biN/,'binuclear')
  #    ngcdescription.sub!(/bn/,'brightest towards the north side')
  #    ngcdescription.sub!(/bp/,'brightest towards the preceding side')
  #    ngcdescription.sub!(/bs/,'brightest towards the south side')
  #    ngcdescription.sub!(/C/,'compressed')
  #    ngcdescription.sub!(/C.G.H/,'Cape of Good Hope')
  #    ngcdescription.sub!(/ch/,'chevelure')
     ngcdescription.sub!(/Cl/,'cluster ')
  #    ngcdescription.sub!(/co/,'coarse, coarsely')
  #    ngcdescription.sub!(/com/,'cometic (cometary form)')
  #    ngcdescription.sub!(/comp/,'companion')
  #    ngcdescription.sub!(/cont/,'in contact')
  #    ngcdescription.sub!(/D/,'double')
  #    ngcdescription.sub!(/def/,'defined')
  #    ngcdescription.sub!(/dif/,'diffused')
  #    ngcdescription.sub!(/diffic/,'difficult')
  #   ngcdescription.sub!(/dist/,'distance or distant')
       ngcdescription.sub!(/E/,'extended ')
      ngcdescription.sub!(/eef/,'most extremely faint ')
      ngcdescription.sub!(/eeF/,'most extremely faint ')      
      ngcdescription.sub!(/eF/,'extremely faint')
      if ngcdescription.include?("ee")
        if !ngcdescription.include?("between")
          ngcdescription.sub!(/ee/,'most extremely ')
        end
      end
  #    ngcdescription.sub!(/er/,'easily resolvable')
  #    ngcdescription.sub!(/exc/,'excentric')
     ngcdescription.sub!(/F/,'faint ')
  #    ngcdescription.sub!(/glob/,'globular')
  #    ngcdescription.sub!(/gr/,'group')
     ngcdescription.sub!(/\Ai/,'irregular ')
  #    ngcdescription.sub!(/iF/,'irregular figure')
  #    ngcdescription.sub!(/inv/,'involved,involving')
      ngcdescription.sub!(/L/,'large ')
      ngcdescription.sub!(/M/,'middle')
  #    ngcdescription.sub!(/m/,'much ')
  #    ngcdescription.sub!(/mm/,'mixed magnitudes')
  #    ngcdescription.sub!(/mn./,'milky nebulosity')
      if !ngcdescription.include?("NGC")
        ngcdescription.sub!(/N/,'nucleus ')
      end
  #    ngcdescription.sub!(/neb/,'nebula')
  #    ngcdescription.sub!(/nebs/,'nebulous')
  #    ngcdescription.sub!(/neby/,'nebulosity')
  #    ngcdescription.sub!(/nf/,'north following')
  #    ngcdescription.sub!(/np/,'north preceding')
  #    ngcdescription.sub!(/nr/,'near')
  #    ngcdescription.sub!(/ns/,'north-south')
  #    ngcdescription.sub!(/P/,'poor (sparse) in stars')
  #    ngcdescription.sub!(/pf/,'preceding-following')
  #    ngcdescription.sub!(/pg/,'pretty gradually')
  #    ngcdescription.sub!(/plan/,'planetary nebula (same as PN)')
  #    ngcdescription.sub!(/pm/,'pretty much')
  #    ngcdescription.sub!(/PN/,'planetary nebula')
  #    ngcdescription.sub!(/prob/,'probably')
  #    ngcdescription.sub!(/ps/,'pretty suddenly')
  #    ngcdescription.sub!(/quad/,'quadrilateral')
     ngcdescription.sub!(/Ri/,'rich ')
       ngcdescription.sub!(/R/,'round ')
 #    ngcdescription.sub!(/RR/,'exactly round')
  #    ngcdescription.sub!(/rr/,'partially resolved, some stars seen')
  #    ngcdescription.sub!(/rrr/,'well resolved, clearly consisting of stars')
      ngcdescription.sub!(/S\s/,'small ')
      ngcdescription.sub!(/S/,'small in angular size ')
  #    ngcdescription.sub!(/S*/,'small (faint) star')
  #    ngcdescription.sub!(/sc/,'scattered')
  #    ngcdescription.sub!(/sev/,'several')
  #    ngcdescription.sub!(/sf/,'south following')
  #    ngcdescription.sub!(/sh/,'shaped')
  #    ngcdescription.sub!(/sm/,'smaller')
  #    ngcdescription.sub!(/sp/,'south preceding')
  #    ngcdescription.sub!(/st 9..13/,'stars from the 9th to 13th magnitude')
  #    ngcdescription.sub!(/st 9.../,'stars from the 9th magnitude downwards')
  #    ngcdescription.sub!(/stell/,'stellar, pointlike')
  #    ngcdescription.sub!(/susp/,'suspected')
  #    ngcdescription.sub!(/trap/,'trapezium')
  #    ngcdescription.sub!(/triangle/,'forms a triangle with')
  #    ngcdescription.sub!(/triN/,'tri-nuclear')
  #    ngcdescription.sub!(/var/,'variable')
  #    ngcdescription.sub!(/vv/,'very, very')
      ngc_return = ngc_return.rstrip + ", " + ngcdescription
    end   
    return ngc_return
  end
end

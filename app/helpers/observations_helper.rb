module ObservationsHelper
  
  def ngcdescription
    ngc_return = ""
    ngc_array = @observation.body.ngc_description.split(';')
    ngc_array.each do |ngcdescription|
      if ngcdescription.include?("..") then
        if ngcdescription.rstrip.end_with?("..") then
          ngcdescription.sub!("..", 'th magnatude and dimmer')
        end
      end
      ngcdescription.sub!(/!!!/,'a magnificent ')
      ngcdescription.sub!(/!!/,'v remarkable ')
      ngcdescription.sub!(/!/,'remarkable ')
      ngcdescription.sub!(/'/,'arc minutes ')
      ngcdescription.sub!(/"/,'arc seconds')
  #    ngcdescription.sub!(/()/,'items questioned by Dreyer')
      ngcdescription.sub!("*",'stars ')
      ngcdescription.sub!("**",'double star ')
      ngcdescription.sub!("***",'triple star ')
      ngcdescription.sub!("*10",'a star of 10th magnitude ')
      ngcdescription.sub!("*7-8",'star of magnitude 7 or 8 ')
      ngcdescription.sub!(/Ab/,'about ')  
      ngcdescription.sub!(/alm/,'almost ')
  #    ngcdescription.sub!(/\d../,'magnitude' + '\d' + 'and dimmer')
      
  #    ngcdescription.sub!(/am/,'among')
  #    ngcdescription.sub!(/annul/,'annular or ring nebula')
  #    ngcdescription.sub!(/app/,'appended')
  #    ngcdescription.sub!(/att/,'attached')
     ngcdescription.sub!(/B/,'bright ')
  #    ngcdescription.sub!(/b/,'brighter')
  #    ngcdescription.sub!(/bet/,'between')
  #    ngcdescription.sub!(/bf/,'brightest towards the following side')
  #    ngcdescription.sub!(/biN/,'binuclear')
  #    ngcdescription.sub!(/bn/,'brightest towards the north side')
  #    ngcdescription.sub!(/bp/,'brightest towards the preceding side')
  #    ngcdescription.sub!(/bs/,'brightest towards the south side')
  #    ngcdescription.sub!(/C/,'compressed')
  #    ngcdescription.sub!(/c/,'considerably')
  #    ngcdescription.sub!(/C.G.H/,'Cape of Good Hope')
  #    ngcdescription.sub!(/ch/,'chevelure')
     ngcdescription.sub!(/Cl/,'cluster ')
  #    ngcdescription.sub!(/co/,'coarse, coarsely')
  #    ngcdescription.sub!(/com/,'cometic (cometary form)')
  #    ngcdescription.sub!(/comp/,'companion')
  #    ngcdescription.sub!(/cont/,'in contact')
  #    ngcdescription.sub!(/d/,'diameter')
  #    ngcdescription.sub!(/D/,'double')
  #    ngcdescription.sub!(/def/,'defined')
  #    ngcdescription.sub!(/dif/,'diffused')
  #    ngcdescription.sub!(/diffic/,'difficult')
  #   ngcdescription.sub!(/dist/,'distance or distant')
      ngcdescription.sub!(/E/,'extended ')
      ngcdescription.sub!(/e/,'extremely ')
  #    ngcdescription.sub!(/ee/,'most extremely')
  #    ngcdescription.sub!(/er/,'easily resolvable')
  #    ngcdescription.sub!(/exc/,'excentric')
      ngcdescription.sub!(/F/,'faint ')
  #    ngcdescription.sub!(/f/,'following (eastward)')
  #    ngcdescription.sub!(/g/,'gradually')
  #    ngcdescription.sub!(/glob/,'globular')
  #    ngcdescription.sub!(/gr/,'group')
     ngcdescription.sub!(/\Ai/,'irregular ')
  #    ngcdescription.sub!(/iF/,'irregular figure')
  #    ngcdescription.sub!(/inv/,'involved,involving')
      ngcdescription.sub!(/L/,'large ')
  #    ngcdescription.sub!(/l/,'little,long')
  #    ngcdescription.sub!(/m/,'magnitude')
  #    ngcdescription.sub!(/M/,'middle, or in the middle')
      ngcdescription.sub!(/m/,'much ')
  #    ngcdescription.sub!(/mm/,'mixed magnitudes')
  #    ngcdescription.sub!(/mn./,'milky nebulosity')
  #    ngcdescription.sub!(/n/,'north')
  #    ngcdescription.sub!(/N/,'Nucleus, or to a Nucleus')
  #    ngcdescription.sub!(/neb/,'nebula')
  #    ngcdescription.sub!(/nebs/,'nebulous')
  #    ngcdescription.sub!(/neby/,'nebulosity')
  #    ngcdescription.sub!(/nf/,'north following')
  #    ngcdescription.sub!(/np/,'north preceding')
  #    ngcdescription.sub!(/nr/,'near')
  #    ngcdescription.sub!(/ns/,'north-south')
  #    ngcdescription.sub!(/P/,'poor (sparse) in stars')
  #    ngcdescription.sub!(/p/,'preceding (westward)')
  #    ngcdescription.sub!(/p/,'pretty (before F,B,L,S)')
  #    ngcdescription.sub!(/pf/,'preceding-following')
  #    ngcdescription.sub!(/pg/,'pretty gradually')
  #    ngcdescription.sub!(/plan/,'planetary nebula (same as PN)')
  #    ngcdescription.sub!(/pm/,'pretty much')
  #    ngcdescription.sub!(/PN/,'planetary nebula')
  #    ngcdescription.sub!(/prob/,'probably')
  #    ngcdescription.sub!(/ps/,'pretty suddenly')
  #    ngcdescription.sub!(/quad/,'quadrilateral')
  #    ngcdescription.sub!(/r/,'resolvable (mottled,not resolved)')
     ngcdescription.sub!(/Ri/,'rich ')
       ngcdescription.sub!(/R/,'round ')
 #    ngcdescription.sub!(/RR/,'exactly round')
  #    ngcdescription.sub!(/rr/,'partially resolved, some stars seen')
  #    ngcdescription.sub!(/rrr/,'well resolved, clearly consisting of stars')
      ngcdescription.sub!(/S/,'small in angular size ')
  #    ngcdescription.sub!(/s/,'south')
  #    ngcdescription.sub!(/s/,'suddenly (abruptly)')
  #    ngcdescription.sub!(/S*/,'small (faint) star')
  #    ngcdescription.sub!(/sc/,'scattered')
  #    ngcdescription.sub!(/sev/,'several')
  #    ngcdescription.sub!(/sf/,'south following')
  #    ngcdescription.sub!(/sh/,'shaped')
  #    ngcdescription.sub!(/sm/,'smaller')
  #    ngcdescription.sub!(/sp/,'south preceding')
  #    ngcdescription.sub!(/st 9..13/,'stars from the 9th to 13th magnitude')
  #    ngcdescription.sub!(/st 9.../,'stars from the 9th magnitude downwards')
  #    ngcdescription.sub!(/st/,'stars')
  #    ngcdescription.sub!(/stell/,'stellar, pointlike')
  #    ngcdescription.sub!(/susp/,'suspected')
  #    ngcdescription.sub!(/trap/,'trapezium')
  #    ngcdescription.sub!(/triangle/,'forms a triangle with')
  #    ngcdescription.sub!(/triN/,'tri-nuclear')
     ngcdescription.sub!(/v/,'very ')
  #    ngcdescription.sub!(/var/,'variable')
  #    ngcdescription.sub!(/vv/,'very, very')
      ngc_return = ngc_return.rstrip + ", " + ngcdescription
    end   
    return ngc_return
  end
end

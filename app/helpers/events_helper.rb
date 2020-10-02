module EventsHelper
  def nombre(i)
    if (i.date >= Date.today)
      i.title
    end 
  end

  def nombre_pasado(i)
    if (i.date < Date.today)
      i.title
    else 
      nil
    end 
  end

  def upcoming(i)
      if (i.date >= Date.today)
        i.date
      end 
  end

  def past(i)
    if (i.date < Date.today)
      i.date 
    else
      nil
    end
  end
end
